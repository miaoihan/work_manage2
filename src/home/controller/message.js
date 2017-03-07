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

  // async getMessageAction() {
  // 	let msgId = this.post('msgId')
  // 	// 设置成已读
  // 	await this.model('message').where({id: msgId}).update({is_read: 1})
  // }
}