'use strict';

import Base from './base.js';
import moment from 'moment'

export default class extends Base {
    /**
     * index action
     * @return {Promise} []
     */

    async __before() {
        let user = await this.session('user')
        // let question = this.model('question')
        console.log('###### 打印了 ######');
        this.assign('user', user)
    }

    async findAction() {
        let question = this.model('question')
        let que1 = await question.findByPage(1)
        let page = this.get('page') || 1
        // console.log(page)
        let quePageData = await question.findByPage(page)
        // console.log(quePageData);
        // let queList = await question.order("created_time DESC").select()
        let user = await this.session('user')
        this.assign('quePageData', quePageData)
        // this.assign('queList', queList)
        this.assign('user', user)

        return this.display('index/index')
    }

    async addAction() {
        let user = this.session('user')

        let model = this.model('question')
        let id = this.post('id')
        let question = this.post()
        //if is old
        if (id) {
            await model.where({ id: id }).update(question)
            return this.redirect('find')
        }
        //if is new
        if (await model.add(question)) {
            // this.findAction()
            this.redirect('find')
        } else {
            this.assign('info', 'error')
        }
    }

    async editAction() {
        let model = this.model('user')
        let user = model.where({ id: this.get('id') }).find()
        if (this.isGet()) {
            this.assign('user', user)
            return this.display('add')
        }
        let id = this.get('id')
        let result = await model.where({ id: id }).upadte({
            name: this.post('name'),
            password: this.post('password')
        })
    }

    async deleteAction() {
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

    async detailsAction() {
        let questionM = this.model('question')
        let answer = this.model('answer')
        let id = this.get('id')
        let question = await questionM.where({ id: id }).find()
        let answerList = await answer.where({ q_id: id }).order("id DESC").select()
        if (question) {
            //self in the find url,so need another
            this.assign('question', question)
            this.assign('answerList', answerList)
            return this.display('details')
        }
    }

    async answerAction() {
        let answer = this.model('answer')
        let content = this.post('content')
        let q_id = this.post('qid')
        if (await answer.add({  
                content: content,
                q_id: q_id
            })) {
            // this.findAction()
            this.redirect(`/question/details/${q_id}`)
        } else {
            this.assign('info', 'error')
        }
    }

    

}