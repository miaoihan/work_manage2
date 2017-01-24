'use strict';

import Base from './base.js';

export default class extends Base {
  /**
   * index action
   * @return {Promise} []
   */
  async indexAction(){
    let question = this.model('question')
    let queList = await question.order("created_time DESC").select()
    let newQue = queList.shift()
    let user = await this.session('user')
    this.assign('queList', queList)
    this.assign('user', user)
    this.assign('newQue', newQue)
    return this.display()
  }
}