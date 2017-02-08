'use strict';

import Base from './base.js';

export default class extends Base {
  /**
   * index action
   * @return {Promise} []
   */
  async indexAction(){
    let question = this.model('question')
    let userDao = this.model('user')
    let que1 = await question.findByPage(1)
    let page = this.get('page') || 1
    // console.log(page)
    let quePageData = await question.findByPage(page)
    // console.log(quePageData);
    let uid = await this.session('uid') //从session里uid找user
    console.log('###### 打印了3 ######'+uid);
    
    let user = await userDao.findById(uid)
    this.assign('quePageData', quePageData)
    // this.assign('queList', queList)
    this.assign('user', user)
    return this.display()
  }
}