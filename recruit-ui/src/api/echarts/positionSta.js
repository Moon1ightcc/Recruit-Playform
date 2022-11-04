import request from '@/utils/request'

// 查询公司地址分布
export function getpositionCount() {
    return request({
        url: '/position/sta/positionCount',
        method: 'get'
    })
}