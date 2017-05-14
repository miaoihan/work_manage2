'use strict';

import Base from './base.js';
import fs from 'fs-promise';

export default class extends Base {
	/**
	 * index action
	 * @return {Promise} []
	 */
	async answerAction() {
		let answerDao = this.model('answer')
		let userDao = this.model('user')
		let qid = this.post('q_id')
		let currentUser = await userDao.findById(await this.session('uid'))
		//更新已回答列表 和 该问题回答的查看权
		let hasAnswerList = currentUser.has_answer + qid + ','
		let canseeList = currentUser.cansees + qid + ','
		await userDao.where({
			id: await this.session('uid')
		}).update({
			has_answer: hasAnswerList,
			cansees: canseeList
		})
		let answerForm = this.post()
		// 设置answer为已提交
		answerForm.commit_state = 1
		// 同步缓存区
		answerForm.content_catch = this.post('content_md')
		await answerDao.save(answerForm)
		return this.redirect(`/question/details?id=${qid}`)

	}

	/**
	 * 教师批改
	 * @return {Json or Promise} []
	 */
	async commentAction() {
		let commentDao = this.model('comment')
		// this.success(this.post())
		let userDao = this.model('user')
		let qid = this.post('q_id')
		let level = this.post('level')
		let title = this.post('title')
		let scored = this.post('scored')
		let content = this.post('content_html') // 评语内容
		let auid = this.post('a_u_id') // 学员id
		let aid = this.post('a_id') // 回答id
		let commentForm = this.post()
		let commit_state
		let message = {
			to: auid,
			from: 0, //默认系统发送
			content: '',
			link: '',
			type: '',
			is_read: 0
		} // content and is_read
		// >60分学员升一级
		if (scored >= 60) {
			commit_state = 3
			let user = await userDao.where({
				id: auid
			}).find() //学员
			//如果比用户级别高则升级
			let old_level = user.level
			if (level > old_level) {
				await userDao.where({
					id: auid
				}).update({
					level: level
				})
			}
			// 已放在回答直接更新
			// let has_answer = user.has_answer + level + ','
			// await userDao.where({id: auid}).update({has_answer: has_answer})
			//通知学员通过
			// 统一使用 Message.html         
			message.link = `/question/details?id=${qid}`
			message.content = `你通过了关于 ${title} 的回答，最终得分是 ${scored}分，恭喜你升了一级！`
			let emailContent = `你通过了关于 <a href="http://work.mafengshe.com/question/details?id=${qid}">${title}</a> 的回答，最终得分是 ${scored}分，老师对你的评语是：</br> ${content}`
			this.sendMailAction(emailContent, this.post('email'))
		} else { // 低于60分
			// 设置回答为未批改未通过
			commit_state = 2
			//通知学员没通过        
			message.link = `/question/details?id=${qid}`
			message.content = '你的回答 ' + title + ' 没有通过'
			let emailContent = `你的回答 <a href="http://work.mafengshe.com/question/details?id=${qid}">${title}</a> 没有通过，最终得了 ${scored}分，老师对你的评语是：</br> ${content}`
			// 发送邮件.
			this.sendMailAction(emailContent, this.post('email'))
		}
		await commentDao.add(this.post())
		// uodate scored 
		await this.model('answer').where({
			id: aid
		}).update({
			scored: scored,
			is_good: this.post('is_good')
		})
		// update message
		await this.model('message').add(message)
		// 修改问题状态
		await this.model('answer').where({
			id: aid
		}).update({
			commit_state: commit_state
		})
		// 设置该学员对于该问题的查看权限
		await userDao.addCanseeTo(qid, auid)
		// 如果是ajax方式提交，输出Json
		if (this.isAjax('post'))
			return this.success()
		this.redirect(`/question/details?id=${qid}`)
	}

	async tmpsaveAction() {
		let answerDao = this.model('answer')
		let answer = this.post()
		let aid = this.post('id')
		let commit_state = this.post('commit_state')
		let content = this.post('content_md')
		// 如果尚未提交
		if (!commit_state || commit_state == 0) {
			// 暂存区内容
			answer.content_catch = content
			// if (await answerDao.add(answer)) {
			// 	return this.success()
			// } else {
			// 	return this.fail(1000,'暂存失败，请稍后再试')
			// }
			try {
				await answerDao.save(answer)
				return this.success()
			} catch (e) {
				// return this.fail(1000,'暂存失败，请稍后再试')
				return this.fail(1000, e)
			}

		}
		// 如果已经提交
		try {
			answerDao.where({
				id: aid
			}).update({
				content_catch: content
			})
			return this.success()
		} catch (e) {
			// return this.fail(1000,'暂存失败，请稍后再试')
			return this.fail(1000, e)
		}
	}

	/**
	 * 教师批改
	 * @return {Json or Promise} []
	 */
	async editCommentAction() {
		let commentDao = this.model('comment')
		// this.success(this.post())
		let userDao = this.model('user')
		let qid = this.post('q_id')
		let level = this.post('level')
		let title = this.post('title')
		let scored = this.post('scored')
		let content = this.post('content_html') // 评语内容
		let auid = this.post('a_u_id') // 学员id
		let aid = this.post('a_id') // 回答id

		await commentDao.add(this.post())

		// 如果是ajax方式提交，输出Json
		if (this.isAjax('post'))
			return this.success()
		this.redirect(`/question/details?id=${qid}`)
	}

	/**
	 * 图片上传api
	 */
	async uploadAction() {
		//图片上传
		let file = this.file('image')
		let newName = 'pic' + new Date().getTime() // a new name
		let newPath = '/static/upload/article/' + newName + '.jpg'
		//用户上传头像了才会更新
		if (file && file.size != 0) {
			try {
				await fs.move(file.path, think.RESOURCE_PATH + newPath)
				this.success(newPath)
			} catch (error) {
				this.fail(error)
				throw error;
			}
		}
		// 
		
	}

}