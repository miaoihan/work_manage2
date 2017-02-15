'use strict';

import Base from './base.js';
import moment from 'moment'

export default class extends Base {
    /**
     * 代码即注释
     * index action
     * @return {Promise} []
     */

    async __before() {
        let user = await this.session('user')
        // let question = this.model('question')
        console.log('###### 打印了 ######');
        this.assign('user', user)
    }

    //此方法不再更新，转到index
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
            // return this.action('home/index', index)
            return this.redirect('/')
        }
        //if is new
        if (await model.add(question)) {
            // this.findAction()
            this.redirect('/')
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
        let question = this.model('question')
        let id = this.get('id')
            //返回影响的行数
        let result = await question.where({ id: id }).delete()
        if (result) {
            //self in the find url,so need another
            this.redirect('/')
                // this.findAction()
        }
    }

    async detailsAction() {
        let questionM = this.model('question')
        let answer = this.model('answer')
        let id = this.get('id')
        let question = await questionM.where({ id: id }).find()
        let user = this.model('user').findById(await this.session('uid'))
        let noReadNum = this.model('user').getNoReadNum(await this.session('uid'))
        // console.log('###### 打印了1 ######'+question.id);
        let sql = `select * from answer left join comment on answer.id = comment.a_id 
                   where answer.q_id = ${id} order by answer.id DESC`
        // console.log(sql);
        // let answerList = await answer.query(sql)
        // let answerList = await answer.join('comment on answer.id = comment.a_id').
        //                               where({ q_id: id }).order('answer.id DESC').select()
        let answerList = await answer.where({ q_id: id }).order('id DESC').select()
        // this.success(answerList);
        
        if (question) {
            this.assign('question', question)
            this.assign('answerList', answerList)
            this.assign('noReadNum', noReadNum)
            this.assign('user', user)
            return this.display('details')
        }
    }

    // async answerAction() {
    //     let answer = this.model('answer')
    //     let content = this.post('content')
    //     let q_id = this.post('qid')
    //     if (await answer.add({  
    //             content: content,
    //             q_id: q_id
    //         })) {
    //         // this.findAction()
    //         this.redirect(`/question/details/${q_id}`)
    //     } else {
    //         this.assign('info', 'error')
    //     }
    // }

    

}