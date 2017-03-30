'use strict';

export default class extends think.controller.base {
  /**
   * some base method in here
   */

  async __before() {
	  //部分 action 下不检查
	  let blankActions = ['login'];
	  this.success(this.http.action)
	  if(blankActions.indexOf(this.http.action)){
	  	  return;
	  }
	  let currentUser = await this.model('user').findById(await this.session('uid'))
	  //判断 session 里的 userInfo
	  if(think.isEmpty(currentUser)){
	      return this.redirect('/');
	  }
  }
}