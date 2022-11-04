package com.zeus.common.core.domain.vo;


public class RegisterCompanyVo {

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
     * 用户邮箱
     */
    private String email;

    /**
     * 公司地址
     */
    private String companyAddress;

    /**
     * 公司名称
     */
    private String companyName;


    /**
     * 企业性质
     */
    private String nature;

    /**
     * 备注
     */
    private String remark;

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

    public void setUserName(String userName) {
        this.userName = userName;
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

    public String getCompanyAddress() {
        return companyAddress;
    }

    public void setCompanyAddress(String companyAddress) {
        this.companyAddress = companyAddress;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getNature() {
        return nature;
    }

    public void setNature(String nature) {
        this.nature = nature;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public String toString() {
        return "RegisterCompanyVo{" +
                "nickName='" + nickName + '\'' +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", phonenumber='" + phonenumber + '\'' +
                ", email='" + email + '\'' +
                ", companyAddress='" + companyAddress + '\'' +
                ", companyName='" + companyName + '\'' +
                ", nature='" + nature + '\'' +
                ", remark='" + remark + '\'' +
                ", code='" + code + '\'' +
                '}';
    }
}
