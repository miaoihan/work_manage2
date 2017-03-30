'use strict';

export default class extends think.controller.base {
  /**
   * some base method in here
   */

  async __before() {
	  //部分 action 下不检查
	  let blankActions = ['index','login','register'];
	//   this.success(this.http.action)
	  if(blankActions.indexOf(this.http.action)!= -1){
	  	  return;
	  }
	  let currentUser = await this.model('user').findById(await this.session('uid'))
	//   判断是否登录
	  if(think.isEmpty(currentUser)){
	      return this.redirect('/user/login');
	  }
  }
}