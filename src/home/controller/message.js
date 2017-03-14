'use strict';

import Base from './base.js';

export default class extends Base {
  /**
   * 代码即注释
   * index action
   * @return {Promise} []
   */

  async readmessageAction() {
    let msgId = this.post('msgId')
      // 设置成已读; 
    await this.model('message').where({ id: msgId }).update({ is_read: 1 })
  }

  /**
   * 
   */
  async getMessageAction() {
    let user = await this.model('user').findById(await this.session('uid'))
    let message = user.message
  }

  /**
   * 获取未读消息数
   */
  async getNoReadNumAction() {
    let noReadNum = this.model('user').getNoReadNum(await this.session('uid'))
    this.success(noReadNum)
  }

  // async getMessageAction() {
  // 	let msgId = this.post('msgId')
  // 	// 设置成已读
  // 	await this.model('message').where({id: msgId}).update({is_read: 1})
  // }
}