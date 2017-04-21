'use strict';

import Base from './base.js';
import moment from 'moment'

export default class extends Base {
    /**
     * 代码即注释
     * index action
     * @return {Promise} []
     */

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
        let questionDao = this.model('question')
        let answerDao = this.model('answer')
        let qid = this.get('id')
        let uid = await this.session('uid')
        let question = await questionDao.where({ id: qid }).find()
        let currentUser = await this.model('user').findById(uid)
        // this.success(currentUser)
        let noReadNum = this.model('user').getNoReadNum(uid)
        let sql = `select * from answer left join comment on answer.id = comment.a_id 
                   where answer.q_id = ${qid} order by answer.id DESC`
        // let answerList = await answer.query(sql)
        // let answerList = await answer.join('comment on answer.id = comment.a_id').
        // where({ q_id: id }).order('answer.id DESC').select()

        // 当前用户在该问题下的状态
        let answerList = await answerDao.where({ q_id: qid, commit_state: {'>': 0} }).order('id DESC').select()
        // this.success(answerList);  
        let answer = await answerDao.where({ q_id: qid, u_id: uid }).select()
        if ( answer.length > 0 ){
            // this.success(answer[0].content_md)
            // 渲染文本编辑器的暂存内容
            this.assign('answer', answer[0])
        }
        // 判断当前用户是否可查看该问题的回答，折叠展开
        let cansee = false
        if (currentUser.role < 2) cansee = true
        else {
            let canseeList = currentUser.cansees.split(',')
            if (canseeList.indexOf(qid) != -1)
                cansee = true
        }
        // this kind of methond is too low b

        // // 判断当前用户是否回答了该问题
        // let hasAnswerList = currentUser.has_answer.split(',')
        // // this.success(currentUser)
        // let hasAnswer  = false //bool

        // for (let i of hasAnswerList) {
        //     if (id == i) {
        //         hasAnswer = true
        //     }       
        // }
        // this.success(hasAnswer)

        // 当前用户对该题目的状态
        // let answer = answerDao.where({q_id: qid, u_id: uid}).find()

        if (question) {
            this.assign('question', question)
            this.assign('answerList', answerList)
            this.assign('noReadNum', noReadNum)
            this.assign('user', currentUser)
            this.assign('cansee', cansee)
            // this.assign('hasAnswer', hasAnswer)
            return this.display('details')
        }
    }

    

    

}