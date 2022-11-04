import request from '@/utils/request'

// 普通用户注册注册
export function registerUser(data) {
    return request({
        url: '/recruit/register/user',
        method: 'post',
        data: data
    })
}

// 企业用户注册注册
export function registerComapny(data) {
    return request({
        url: '/recruit/register/company',
        method: 'post',
        data: data
    })
}

// export function common(url,data) {
//     return request({
//         url: url,
//         method: 'post',
//         data: data
//     })
// }


// 权限码请求接口,防止重复发送验证码
export function getRequestPermissionCode(data) {
    return request({
        url: '/common/code/request',
        method: 'post',
        data: data
    })
}

// 邮箱验证码接口
export function sendEmailCode(registerParam) {
    return request({
        url: '/common/code/email',
        method: 'post',
        data: registerParam
    })
}
