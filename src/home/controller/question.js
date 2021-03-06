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

    /**
     * 增加和编辑
     */
    async saveAction() {
        let user = this.session('user')
        let model = this.model('question')
        let qid = this.post('id')
        let question = this.post()
        // 编辑
        if (qid) {
            await model.where({ id: qid }).update(question)
            // return this.action('home/index', index)
            return this.redirect(`/question/details?id=${qid}`)
        }
        // 新增
        if (await model.add(question)) {
            // this.findAction()
            this.redirect('/')
        } else {
            this.assign('info', 'error')
        }
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

    /**
     * 问题详情
     */
    async detailsAction() {
        let questionDao = this.model('question')
        let answerDao = this.model('answer')
        let qid = this.get('id')
        let uid = await this.session('uid')
        let question = await questionDao.where({ id: qid }).find()
        let currentUser = await this.model('user').findById(uid)
        // this.success(currentUser)
        let noReadNum = this.model('user').getNoReadNum(uid)
        // 当前用户在该问题下的状态
        let answerList = await answerDao.where({ q_id: qid, commit_state: {'>': 0} }).order('id DESC').select()
        // this.success(answerList);  
        let answer = await answerDao.where({ q_id: qid, u_id: uid }).select()
        if ( answer.length > 0 ){
            this.assign('answer', answer[0]) // 渲染文本编辑器的暂存内容
        }
        // 判断当前用户是否可查看该问题的回答，折叠展开
        let cansee = false
        if (currentUser.role.type < 2) cansee = true
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