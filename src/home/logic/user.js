'use strict';
import fs from 'fs-promise';

/**
 * logic
 * @param  {} []
 * @return {}     []
 */
export default class extends think.logic.base {
  async findAction(){
    let currentUser = await this.model('user').findById(await this.session('uid'))
    // 禁止非管理员访问
    if(think.isEmpty(currentUser)){
			return this.redirect('/');
		}
    if (currentUser.role > 2){
      return this.redirect('/');
    }
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