'use strict';
/**
 * model
 */
import moment from 'moment'
export default class extends think.model.relation {
  /**
   * init
   * @param  {} args []
   * @return {}         []
   */
    init(...args){
        super.init(...args);
        //建立和用户以及评论的关联
        this.relation = {
            comment: {
                type: think.model.HAS_ONE, //relation type
                model: "comment", //model name
                name: "comment", //data name
                key: "id", 
                fKey: "a_id", //forign key
                // order: "",
                // limit: "",
            },
            user: {
                type: think.model.BELONG_TO, //relation type
                model: "user", //model name
                name: "user", //data name
                key: "u_id", 
                fKey: "id", //forign key
            }
        }
    }

    /**
     * 数据表字段定义
     * @type {Object}
     */
    schema = {
        q_id: { //问题的id
            default: function() { 
                return null
            }
        },
        c_id: { //回复的回复
            default: function() { 
                return null
            }
        },
        del_state: { 
            default: function() { 
                return 0
            }
        },
        created_time: { //创建时间
            default: () => { //获取当前时间
                // return moment().format("YYYY-MM-DD HH:mm:ss")
                return new Date().getTime()
            },
            readonly: true //只读，添加后不可修改
        }
    }

    getUserList() {

    }


}