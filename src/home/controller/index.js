'use strict';

import Base from './base.js';

export default class extends Base {
  /**
   * index action
   * @return {Promise} []
   */
  async indexAction(){
    let question = this.model('question')
    let que1 = await question.findByPage(1)
    let newQue = que1.data[0]
    let page = this.get('page') || 1
    // console.log(page)
    let quePageData = await question.findByPage(page)
    if(page == 1)
      //删掉最新
      quePageData.data.shift()
    // let queList = await question.order("created_time DESC").select()
    let user = await this.session('user')
    this.assign('quePageData', quePageData)
    // this.assign('queList', queList)
    this.assign('user', user)
    this.assign('newQue', newQue)
    return this.display()
  }
}