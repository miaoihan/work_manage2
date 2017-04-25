'use strict';

import Base from './base.js';
import fs from 'fs-promise';

export default class extends Base {
	/**
	 * 代码即注释
	 * 前置魔术方法
	 * @return {Promise} []
	 */
	
	async registerAction() {
		if (this.isGet()) {
			return this.display()
		}
		let id = this.post('id')
		let user = this.post()
		// 生成gravator头像url
		let logo = this.model('user').getAvatarUrl(this.post('email'))
		// 加密存储
		let crypto = require('crypto')
		let password = this.post('password')
		let shasum = crypto.createHash('sha1')
		shasum.update(password)
		password = shasum.digest('hex')
		user.password = password; user.logo = logo
		if (await this.model('user').add(user)) {
			// 注册成功后发送邮件
			let html = '恭喜你成功注册蚂蜂社作业管理系统！,您现在可以登录了<a>http://work.mafengshe.com/user/login</a>'
			this.sendMailAction('恭喜你成功注册蚂蜂社作业管理系统！', this.post('email'))
			this.success()
		} else {
			this.fail()
		}
	}
	/**
	 * session 存用户id
	 * 解决不登出 也可更新用户信息
	 */
	async loginAction() {
		if (this.isGet()) return this.display()
		let model = this.model('user')
			// let user = this.post()
		let email = this.post('email')
		// 密码加密
		let password = this.post('password');
		let crypto = require('crypto');
		let shasum = crypto.createHash('sha1');
		shasum.update(password);
		password = shasum.digest('hex');

		let user = await model.where({ email: email, password: password }).find()
		// console.log(user);
		if (think.isEmpty(user)) {
			return this.fail('用户名或密码错误')
			// return this.display()
		}
		// session  存用户id
		await this.session("uid", user.id);
		return this.success()
		// return this.redirect('/')
	}

	/**
	 * 用户登出
	 */
	async logoutAction() {
		this.session()
		return this.redirect('login')
	}

	async editAction() {
		let id = this.get('id')
		let userDao = this.model('user')
		let user = this.model('user').where({ id: id }).find()
		let currentUser = await userDao.findById(await this.session('uid'))
		if (this.isGet()) {
			// 访问权限控制
			if (currentUser.role.type > 1 && currentUser.id != id) 
				return this.redirect('/')
			this.assign('user', user)
			return this.display()
		}
		let postID = this.post('id')
			//图片上传
		let file = this.file('logo') //用户头像
		let newName = 'pic' + new Date().getTime() // a new name
		let newPath = '/static/upload/user/' + newName + '.jpg'
			// this.success(this.post())
		try{
			await userDao.where({ id: postID }).update(this.post())
		} catch(e) {
			console.log(e);
		}
		//用户上传头像了才会更新
		if (file.size != 0) {
			try {
				await fs.move(file.path, think.RESOURCE_PATH + newPath)
				await userDao.where({ id: postID }).update({ logo: newPath })
			} catch (error) {
				throw error
			}
		}
		// this.success(this.post())
		return this.redirect(`/user/profile?id=${postID}`)
	}

	async deleteAction() {
		// console.log(66666);
		let user = this.model('user')
		let id = this.get('id')
			//返回影响的行数   
		let result = await user.where({ id: id }).delete()
		if (result) {
			//self in the find url,so need another
			this.redirect('/user/find')
				// this.findAction()
		}
	}

	/**
	 * 发现用户列表
	 */
	async findAction() {
		let user = this.model('user')
		let userList = await user.select()
		this.assign('userList', userList)
		return this.display('find')
	}

	/**
	 * 个人资料页
	 */
	async profileAction() {
		let userDao = this.model('user')
		let id = this.get('id')
		let user = await userDao.where({ id: id }).find()
		this.assign('user', user)
		return this.display()
	}

	/**
	 * 批改作业
	 */
	async checkAction() {
		let answerDao = this.model('answer')
		let answerList = await answerDao.where({commit_state: 1}).select()
		// this.success(answerList)
		this.assign('answerList',answerList)
		return this.display()
	}

	/**
	 * API接口
	 * 获取未读消息数
	 */
	async getnoreadnumAction() {
		let userDao = this.model('user')
		let user = await userDao.findById(await this.session('uid'))
		let num = 0
		if (user) {
			for (let i of user.messageList) {
				if (i.is_read == 0)
					num++
			}
		}
		this.success(num)
				
	}



}