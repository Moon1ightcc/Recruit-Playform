import request from '@/utils/request'


// 查询岗位大分类列表
export function listBigCategory() {
  return request({
    url: '/category/vo/queryAllCategory',
    method: 'get',
  })
}


// 查询岗位分类列表
export function listCategory(query) {
  return request({
    url: '/recruit/category/list',
    method: 'get',
    params: query
  })
}



// 查询岗位非大分类列表
export function listCategoryNotParent(query) {
  return request({
    url: '/recruit/category/listNotParent',
    method: 'get',
    params: query
  })
}

// 查询岗位分类详细
export function getCategory(positionId) {
  return request({
    url: '/recruit/category/' + positionId,
    method: 'get'
  })
}

// 新增岗位分类
export function addCategory(data) {
  return request({
    url: '/recruit/category',
    method: 'post',
    data: data
  })
}

// 修改岗位分类
export function updateCategory(data) {
  return request({
    url: '/recruit/category',
    method: 'put',
    data: data
  })
}

// 删除岗位分类
export function delCategory(positionId) {
  return request({
    url: '/recruit/category/' + positionId,
    method: 'delete'
  })
}
