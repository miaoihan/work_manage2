'use strict';

export default class extends think.controller.base {
  /**
   * some base method in here
   */

  // async __before() {
  //       let user = await this.session('user')
  //       // let question = this.model('question')
  //       console.log('###### 打印了 ######');
  //       if(think.isEmpty(this.get('page'))){
  //           console.log('###### 打印了6 ######');
  //           let quePageData = await question.page(1, 10).countSelect();
  //           console.log('###### 打印了2 ######');
  //       }else{
  //           let quePageData = await question.page(this.get("page"), 10).countSelect();
  //           console.log(quePageData);
  //       }
  //       this.assign('user', user)
  //   }
}