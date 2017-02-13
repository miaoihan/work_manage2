'use strict';

import Base from './base.js';

export default class extends Base {
  /**
   * index action
   * @return {Promise} []
   */
  async answerAction() {
		let answer = this.model('answer')
		let content = this.post('content')
		let qid = this.post('q_id')
		if (await answer.add(this.post())) {
			// this.findAction()
			this.redirect(`/question/details?id=${qid}`)
		} else {
			this.assign('info', 'error')
		}
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
		// 学员id
		let auid = this.post('a_u_id')
		let message = {
			content: '',
			is_read: 0
		} // content and is_read
		// console.log('###### 打印了 ######'+ auid);
		// >60分学员升一级
		if (this.post('scored') >= 60){
			let user = await userDao.where({id: auid}).find() //学员
			//如果比用户级别高则升级
			let old_level = user.level
			if (level > old_level){
				await userDao.where({id: auid}).update({level: level})
			}
			let has_answer = user.has_answer + level + ','
			//更新已回答列表
			await userDao.where({id: auid}).update({has_answer: has_answer})
			//通知学员通过
			message.content = '恭喜你回答通过了，你升了一级，离50级大神又近了一步！'
		} else{
			//通知学员没通过
			message.content = '你的回答没有通过！'
		}
		await comment.add(this.post())
		//update message
		message = JSON.stringify(message)
		await userDao.where({id: auid}).update({message: message})

		this.redirect(`/question/details?id=${qid}`)
  }


}