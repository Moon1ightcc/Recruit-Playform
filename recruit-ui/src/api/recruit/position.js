import request from '@/utils/request'

// 查询热门招聘岗位列表
export function listHotPosition() {
  return request({
    url: '/position/vo/listHotPosition',
    method: 'get',
  })
}

// 查询招聘岗位列表
export function listByPositionName(query) {
  return request({
    url: '/position/vo/listByPositionName',
    method: 'get',
    params: query
  })
}

// 查询招聘岗位列表
export function listByCompanyName(query) {
  return request({
    url: '/position/vo/listByCompanyName',
    method: 'get',
    params: query
  })
}


// 查询招聘岗位列表
export function listPosition(query) {
  return request({
    url: '/recruit/position/list',
    method: 'get',
    params: query
  })
}

// 前端查询招聘岗位详细
export function getPositionInfoVo(recruitId) {
  return request({
    url: '/position/vo/' + recruitId,
    method: 'get'
  })
}

// 查询招聘岗位详细
export function getPosition(recruitId) {
  return request({
    url: '/recruit/position/' + recruitId,
    method: 'get'
  })
}

// 新增招聘岗位
export function addPosition(data) {
  return request({
    url: '/recruit/position',
    method: 'post',
    data: data
  })
}

// 修改招聘岗位
export function updatePosition(data) {
  return request({
    url: '/recruit/position',
    method: 'put',
    data: data
  })
}

// 删除招聘岗位
export function delPosition(recruitId) {
  return request({
    url: '/recruit/position/' + recruitId,
    method: 'delete'
  })
}
