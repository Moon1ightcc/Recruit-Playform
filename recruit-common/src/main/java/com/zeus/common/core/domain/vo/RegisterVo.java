package com.zeus.common.core.domain.vo;

public class RegisterVo {
    /**
     * 用户昵称
     */
    private String nickName;

    /**
     * 用户名
     */
    private String userName;

    /**
     * 用户密码
     */
    private String password;


    /**
     * 联系电话
     */
    private String phonenumber;


    /**
     * 用户密码
     */
    private String email;

    /**
     * 验证码
     */
    private String code;

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUsername(String username) {
        this.userName = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public String toString() {
        return "RegisterVo{" +
                "nickName='" + nickName + '\'' +
                ", username='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", phonenumber='" + phonenumber + '\'' +
                ", email='" + email + '\'' +
                ", code='" + code + '\'' +
                '}';
    }
}
