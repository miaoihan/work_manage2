'use strict';

import Base from './base.js';

export default class extends Base {
  /**
	 * 代码即注释
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
    //从session里uid找user
    let user = await userDao.findById(await this.session('uid'))
    let noReadNum = userDao.getNoReadNum(await this.session('uid'))
    // this.success(user)
    let can_answer = 0, hasAnswerList = ""
    // this.success(think.isEmpty(hasAnswerList))
    if (user) {
      hasAnswerList = user.has_answer.split(',')
      // this.success(hasAnswerList)
    //最高能回答的答案等级，默认为1；over_level越级回答，默认为3
    
      let over_level = 3, pass_time 
    
      can_answer = hasAnswerList.length-1 + over_level
    }
    this.assign('hasAnswerList', hasAnswerList)
    this.assign('can_answer', can_answer)
    this.assign('quePageData', quePageData)
    this.assign('noReadNum', noReadNum)
    // this.assign('queList', queList)
    this.assign('user', user)
    return this.display()
    
  }
}