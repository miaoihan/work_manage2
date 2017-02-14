'use strict';
/**
 * model
 */
export default class extends think.model.base {

    /**
     * 数据表字段定义
     * @type {Object}
     */
    schema = {
        to: { // 接受者
            default: function() { 
                return null
            }
        },
        from: { // 发送者
            default: function() { 
                return 0
            }
        },
        link: { // 消息链接
            default: function() { 
                return ''
            }
        },
        type: { // 消息类型 0: 系统推送
            default: function() { 
                return 0
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