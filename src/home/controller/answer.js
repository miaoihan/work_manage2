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

		let qid = this.post('q_id')
		
		
  }


}