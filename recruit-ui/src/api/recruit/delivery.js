import request from '@/utils/request'


// 查询简历投递信息列表
export function listDelivery(query) {
  return request({
    url: '/recruit/delivery/list',
    method: 'get',
    params: query
  })
}

// 查询简历投递信息详细
export function getDelivery(deliveryId) {
  return request({
    url: '/recruit/delivery/' + deliveryId,
    method: 'get'
  })
}

// 新增简历投递信息
export function addDelivery(data) {
  return request({
    url: '/recruit/delivery',
    method: 'post',
    data: data
  })
}

// 前端发送简历
export function addDeliveryVo(data) {
  return request({
    url: '/delivery/vo/addDelivery',
    method: 'post',
    data: data
  })
}

// 多条件查询简历
export function listDelievryByParams(data) {
  return request({
    url: '/delivery/vo/listByParams',
    method: 'post',
    data: data
  })
}

// 根据用户昵称查询简历
export function listDeliveryNickName(data) {
  return request({
    url: '/delivery/vo/listByNickName',
    method: 'post',
    data: data
  })
}

// 修改简历投递信息
export function updateDelivery(data) {
  return request({
    url: '/recruit/delivery',
    method: 'put',
    data: data
  })
}

// 删除简历投递信息
export function delDelivery(deliveryId) {
  return request({
    url: '/recruit/delivery/' + deliveryId,
    method: 'delete'
  })
}

// 获取下载方法
export function downloadFile(fileName,del) {
  return request({
    url: '/common/download/?fileName=' + fileName +'&delete='+del,
    method: 'get'
  })
}


//下载图片
export function downloadImgs(params) {
  return request({
    url: '/common/download/url',//后端自定义的下载接口/common/download/url，路径为admin模块的com.ruoyi.web.controller.common;
    responseType: 'blob', //设置后端返回类型为二进制流，不设置会返回乱码
    method: 'get',
    params
  })
}


