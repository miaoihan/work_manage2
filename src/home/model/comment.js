'use strict';
/**
 * model
 */
import moment from 'moment'
export default class extends think.model.relation {

    init(...args){
        super.init(...args);

        this.relation = {
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
        u_id: { //
            default: function() { 
                return null
            }
        },
        a_id: { //
            default: function() { 
                return null
            }
        },
        del_state: { //
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

}