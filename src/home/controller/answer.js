'use strict';

import Base from './base.js';

export default class extends Base {
  /**
   * index action
   * @return {Promise} []
   */
  async answerAction() {
    let answerDao = this.model('answer')
	let userDao = this.model('user')
    let content = this.post('content')
    let qid = this.post('q_id')
	let currentUser = await userDao.findById(await this.session('uid'))
	//更新已回答列表
	let hasAnswerList = currentUser.has_answer + qid 
	await userDao.where({id: await this.session('uid')}).update({has_answer: hasAnswerList})
	let answerForm = this.post()
	// 修改answer状态
	answerForm.commit_state = 1
	await answerDao.save(this.post())
        // this.findAction()
	return this.redirect(`/question/details?id=${qid}`)

}

  /**
   * 教师批改
   * @return {Promise} []
   */
	async commentAction() {
		let comment = this.model('comment')
		let userDao = this.model('user')
		let qid = this.post('q_id')
		let level = this.post('level')
		let title = this.post('title')
		let scored = this.post('scored')
		// 学员id
		let auid = this.post('a_u_id')
		let aid = this.post('a_id')
		let message = {
			to: auid,
			from: 0, //默认系统发送
			content: '',
			link: '',
			type: '',
			is_read: 0
		} // content and is_read
		// >60分学员升一级
		if ( scored >= 60){
			let user = await userDao.where({id: auid}).find() //学员
			//如果比用户级别高则升级
			let old_level = user.level
			if (level > old_level){
				await userDao.where({id: auid}).update({level: level})
			}
			// 已放在回答直接更新
			// let has_answer = user.has_answer + level + ','
			// await userDao.where({id: auid}).update({has_answer: has_answer})
			//通知学员通过
			// 统一使用 Message.html         
			message.link = `/question/details?id=${qid}`
			message.content = '你通过了关于 '+title+' 的回答，恭喜你升了一级！'
			
			this.sendMailAction(message.content, this.post('email'))
			// uodate scored 
			await this.model('answer').where({id: aid}).update({scored: scored})
		} else{
			//通知学员没通过        
			                    
			message.link = `/question/details?id=${qid}`
			message.content = '你的回答 '+title+' 没有通过'
			// 发送邮件.
			this.sendMailAction(message.content, this.post('email'))
		}
		await comment.add(this.post())
		// update message
		await this.model('message').add(message)
		// update answer commit_state
		await this.model('answer').where({id: aid}).update({commit_state: 2})

		this.redirect(`/question/details?id=${qid}`)
  }

	async tmpsaveAction() {
        let answerDao = this.model('answer')
        let answer = this.post()
        // 设置成暂存
        answer.commit_state = 0
		console.log(answer);
		// await answerDao.add(answer)
		// return this.success(answer)
        if (await answerDao.add(answer)) {
            // this.findAction()
            return this.success()
        } else {
            return this.fail(1000,'error')
        }
    }


}