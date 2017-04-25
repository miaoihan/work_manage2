'use strict';

export default class extends think.logic.base {
  	
    /**
    *  在所有ctrollelr之前做检查 
    */
    async __before() {
        //部分 action 下不检查
        let blankActions = ['index','login','register'];
        //  this.success(this.http.action) 
        if(blankActions.indexOf(this.http.action)!= -1){
            return;
        }
        let currentUser = await this.model('user').findById(await this.session('uid'))
            // this.success(1)
            // 如果写了下面的话，任意匹配/user/asd 就会返回currUser json数据
            // this.success(currentUser)
        // 判断是否登录
        if(think.isEmpty(currentUser)){
            return this.redirect('/user/login');
        }
            this.assign('currentUser', currentUser)
    }
}