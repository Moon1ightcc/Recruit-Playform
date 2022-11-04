import request from '@/utils/request'

// 查询简历信息列表
export function listResume(query) {
  return request({
    url: '/recruit/resume/list',
    method: 'get',
    params: query
  })
}


// 公司查询求职用户简历列表
export function companyListResume(query) {
  return request({
    url: '/recruit/resume/company',
    method: 'get',
    params: query
  })
}

// 查询简历信息详细
export function getResume(resumeId) {
  return request({
    url: '/recruit/resume/' + resumeId,
    method: 'get'
  })
}


// 新增简历信息
export function addResume(data) {
  return request({
    url: '/recruit/resume',
    method: 'post',
    data: data
  })
}

// 修改简历信息
export function updateResume(data) {
  return request({
    url: '/recruit/resume',
    method: 'put',
    data: data
  })
}

// 删除简历信息
export function delResume(resumeId) {
  return request({
    url: '/recruit/resume/' + resumeId,
    method: 'delete'
  })
}
