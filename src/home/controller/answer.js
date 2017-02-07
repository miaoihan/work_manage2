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

	async commentAction() {
		let comment = this.model('comment')
		let user = this.model('user')
		let qid = this.post('q_id')
		// 学员id
		let auid = this.post('a_u_id')
		console.log('###### 打印了 ######'+ auid);
		
		// >60分学员升一级
		console.log('###### 打印了2 ######'+ this.post('scored'));
		
		if (this.post('scored') >= 60){
			await user.where({id: auid}).increment('level', 1)
			
			//通知学员通过
		} else{
			//通知学员没通过
		}
		await comment.add(this.post())

		this.redirect(`/question/details?id=${qid}`)
  }


}