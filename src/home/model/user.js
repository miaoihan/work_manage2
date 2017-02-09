'use strict';
import gravatar from 'gravatar';
import lodash from 'lodash';
import moment from 'moment'
/**
 * model
 */
export default class extends think.model.base {
    /**
     * 数据表字段定义
     * @type {Object}
     */
    schema = {
        level: { //等级，当前等级只能回答比这个等级<=的问题
            default: function() { 
                return 0;
            }   
        },
        // 0:系统管理员 1: 普通管理员 2: 普通用户
        role: { //角色，默认是普通用户
            default: function() { 
                return 2;
            }
        },
        created_time: { //创建时间
            default: () => { //获取当前时间
				return new Date().getTime()
            },
            readonly: true //只读，添加后不可修改
        },
        del_state: {
            default: () => { //0 存在 1 删除
                return 0
            }
        }
    }

    getUserList() {

    }

    async findById(id){
			if (id == undefined)
					return null
			return await this.where({id: id}).find()
    }

		getAvatarUrl(email){
			let url = gravatar.url(email, {s: '100', r: 'G', d: 'retro'});
			url = lodash.replace(url, 'www.gravatar.com', 'gravatar.duoshuo.com');
			return url;
		}





}