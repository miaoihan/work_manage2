'use strict';
/**
 * model
 */
export default class extends think.model.base {
    /**
     * role是字典表
     * @type {Object}
     */
    schema = {
        name: { // 角色的名称
            default: function() { 
                return null
            }
        },
        type: { // 角色的类型 0: 系统管理员 1: 普通管理员 2: 毕业用户 3: 学员 4: 非学员用户 5: 游客
            default: function() { 
                return null
            }
        },
        
    }
}