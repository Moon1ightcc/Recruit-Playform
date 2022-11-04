import request from '@/utils/request'

// 查询公司地址分布
export function getCompanyAddress() {
    return request({
        url: '/company/sta/companyAddress',
        method: 'get'
    })
}