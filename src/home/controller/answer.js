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
		let title = this.post('title')
		// 学员id
		let auid = this.post('a_u_id')
		let message = {
			to: auid,
			from: 0, //默认系统发送
			content: '',
			link: '',
			type: '',
			is_read: 0
		} // content and is_read
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
			message.link = `/question/details?id=${qid}`
			message.content = '你通过了关于'+title+' 的回答，你升了一级！'
		} else{
			//通知学员没通过
			message.link = `/question/details?id=${qid}`
			message.content = '你的回答 '+title+' 没有通过'
		}
		await comment.add(this.post())
		//update message
		await this.model('message').add(message)

		this.redirect(`/question/details?id=${qid}`)
  }

	async tmpsaveAction() {
        let answerDao = this.model('answer')
        let answer = this.post()
        // 设置成暂存
        answer.is_commit = 0
		console.log(answer);
		// await answerDao.add(answer)
		// return this.success(answer)
        if (await answerDao.add(answer).buildSql()) {
            // this.findAction()
            return this.success(answer)
        } else {
            return this.fail(1000,'error')
        }
    }


}