'use strict';

import nodemailer from 'nodemailer';

export default class extends think.controller.base {
	/**
	 * some base method in here
	 */

	async __before() {
		let currentUser = await this.model('user').findById(await this.session('uid'))
		this.assign('currentUser', currentUser)
		//部分 action 下不检查
		let blankActions = ['index', 'login', 'register'];
		// this.success(this.http.action)
		if (blankActions.indexOf(this.http.action) != -1) {
			return;
		}

		// this.success(1)
		// 如果写了下面的话，任意匹配/user/asd 就会返回currUser json数据
		// this.success(currentUser)
		// 判断是否登录
		if (think.isEmpty(currentUser)) {
			return this.redirect('/user/login');
		}

	}

	sendMailAction(html, email) {
		// create reusable transporter object using the default SMTP transport
		let transporter = nodemailer.createTransport({
			service: '"qiye.aliyun"',
			auth: {
				user: 'notify@mafengshe.com',
				pass: 'Azl7112585'
			}
		});
		// setup email data with unicode symbols
		let mailOptions = {
			from: '"蚂蜂社团队" <notify@mafengshe.com>', // sender address
			to: email, // list of receivers
			subject: '蚂蜂社作业管理系统消息', // Subject line
			text: '蚂蜂社作业管理系统消息', // plain text body
			html: `${html}` // html body
		};
		// send mail with defined transport object
		transporter.sendMail(mailOptions, (error, info) => {
			if (error) {
				return console.log(error);
			}
			console.log('Message %s sent: %s', info.messageId, info.response);
		});
	}
}