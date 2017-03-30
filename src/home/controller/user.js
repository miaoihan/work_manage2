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
		let model = this.model('user')
		let id = this.post('id')
		let user = this.post()
			//生成gravator头像url
		let logo = this.model('user').getAvatarUrl(this.post('email'))

		let crypto = require('crypto');
		let password = this.post('password');
		let shasum = crypto.createHash('sha1');
		shasum.update(password);
		password = shasum.digest('hex');
		user.password = password
		user.logo = logo
			//if is old
		if (id) {
			await model.where({ id: id }).update(user)
			return this.redirect('find')
		}
		//if is new
		if (await model.add(user)) {
			// this.findAction()
			this.redirect('/user/login')
		} else {
			this.assign('info', 'error')
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
		let password = this.post('password');

		let crypto = require('crypto');
		let shasum = crypto.createHash('sha1');
		shasum.update(password);
		password = shasum.digest('hex');

		let user = await model.where({ email: email, password: password }).find()
			// session  存用户id
		await this.session("uid", user.id);
		// console.log(user);
		if (think.isEmpty(user)) {
			this.assign('info', '用户名或密码错误')
			return this.display()
		}
		this.assign('user', user)
		return this.redirect('/')
	}

	async logoutAction() {
		this.session()
		this.redirect('login')
	}

	async editAction() {
		let model = this.model('user')
		let id = this.get('id')
		let user = model.where({ id: id }).find()
		if (this.isGet()) {
			this.assign('user', user)
			return this.display()
		}
		let postID = this.post('id')
			//图片上传
		let file = this.file('logo') //用户头像
		let newName = 'pic' + new Date().getTime() // a new name
		let newPath = '/static/upload/user/' + newName + '.jpg'
			// this.success(file)
		await model.where({ id: postID }).update(this.post())
		if (file.size != 0) {
			try {
				//用户上传头像了才会更新
				await fs.move(file.path, think.RESOURCE_PATH + newPath)
				await model.where({ id: postID }).update({ logo: newPath })
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

	async findAction() {
		let user = this.model('user')
		let userList = await user.select()
		let currentUser = await this.model('user').findById(await this.session('uid'))
		// this.success(currentUser)
		this.assign('user', 'currentUser')
		this.assign('userList', userList)
		return this.display('find')
	}

	async profileAction() {
		let userDao = this.model('user')
		let id = this.get('id')
		let user = await userDao.where({ id: id }).find()
		this.assign('user', user)
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