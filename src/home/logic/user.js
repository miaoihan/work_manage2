'use strict';
import fs from 'fs-promise';

/**
 * logic
 * @param  {} []
 * @return {}     []
 */
export default class extends think.logic.base {
  /**
   * index action logic
   * @return {} []
   */
  indexAction(){
   
  }

  async loginAction(){
    
  }

  async editAction(){
    if (this.isPost()) {
      //禁止修改等级
      if (this.post('level'))
        this.fail('小伙子／菇凉，哪能这么容易让你改等级！')
    }
  }
}