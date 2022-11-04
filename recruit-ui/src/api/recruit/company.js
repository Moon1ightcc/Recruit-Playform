import request from '@/utils/request'

// 查询企业信息列表
export function listCompany(query) {
  return request({
    url: '/recruit/company/list',
    method: 'get',
    params: query
  })
}

// 查询企业信息详细
export function getCompany(companyId) {
  return request({
    url: '/recruit/company/' + companyId,
    method: 'get'
  })
}

// 新增企业信息
export function addCompany(data) {
  return request({
    url: '/recruit/company',
    method: 'post',
    data: data
  })
}

// 修改企业信息
export function updateCompany(data) {
  return request({
    url: '/recruit/company',
    method: 'put',
    data: data
  })
}

// 删除企业信息
export function delCompany(companyId) {
  return request({
    url: '/recruit/company/' + companyId,
    method: 'delete'
  })
}
