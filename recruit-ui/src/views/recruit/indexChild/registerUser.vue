<template>
  <div class="background">
    <div class="form-wrap clearfix">
      <el-col :span="8">
        <div class="title">求职用户注册</div>
        <br /><br />
        <h3>沟通</h3>
        <p>在线职位及时沟通</p>
        <h3>任性选</h3>
        <p>各大行业职位任你选</p>
      </el-col>
      <el-col :span="16">
        <el-form
          ref="elForm"
          :model="formData"
          :rules="rules"
          size="medium"
          label-width="100px"
        >
          <el-form-item label="用户昵称" prop="user.nickName">
            <el-input
              v-model="formData.user.nickName"
              prefix-icon="el-icon-user"
              maxlength="10"
              show-word-limit
              clearable
              placeholder="请输入用户昵称"
            />
          </el-form-item>
          <el-form-item label="用户账号" prop="user.userName">
            <el-input
              v-model="formData.user.userName"
              prefix-icon="el-icon-user"
              placeholder="请输入用户账号"
              minlength="2"
              maxlength="20"
              show-word-limit
              clearable
            />
          </el-form-item>
          <el-form-item label="用户密码" prop="user.password"  v-show="!isCode">
            <el-input
              v-model="formData.user.password"
              prefix-icon="el-icon-lock"
              placeholder="请输入用户密码"
              type="password"
              minlength="5"
              maxlength="20"
              show-password
            />
          </el-form-item>
          <el-form-item label="联系电话" prop="user.phonenumber">
            <el-input
              v-model="formData.user.phonenumber"
              placeholder="请输入联系电话"
              :maxlength="11"
              show-word-limit
              clearable
              prefix-icon="el-icon-phone"
              :style="{ width: '100%' }"
            ></el-input>
          </el-form-item>
          <el-form-item label="电子邮箱" prop="user.email">
            <el-input
              v-model="formData.user.email"
              prefix-icon="el-icon-s-claim"
              show-word-limit
              clearable
              placeholder="请输入邮箱"
              maxlength="30"
            />
          </el-form-item>
          <el-form-item label="邮箱验证码" prop="user.code">
            <el-input
              v-model="formData.user.code"
              prefix-icon="el-icon-chat-line-round"
              placeholder="请输入6位验证码"
            >
              <el-button
                slot="append"
                @click="getCodeFun()"
                :disabled="disabled"
                >{{ msg }}</el-button
              >
            </el-input>
          </el-form-item>
          <el-form-item size="large">
            <el-button type="primary" @click="submitForm">提交</el-button>
            <el-button @click="resetForm">重置</el-button>
          </el-form-item>
        </el-form>
      </el-col>
    </div>
  </div>
</template>
<script>
import MyContainer from "@/components/Me/MyContainer";
import {
  registerUser,
  getRequestPermissionCode,
  sendEmailCode,
} from "@/api/recruit/register";

export default {
  components: { MyContainer },
  props: [],
  data() {
    return {
      isCode: false,
      formData: {
        user: {
          // 邮箱验证码
          code: "",
        },
      },
      emailJson: {
        email: "",
      },
      EmailCode: {
        email: "",
        permissionCode: "",
      },
      // 倒计时
      disabled: false,
      msg: "点击获取验证码",
      count: 60,
      timer: 0,
      rules: {
        "user.userName": [
          {
            required: true,
            message: "请输入账号名称，长度在2到20之间",
            trigger: "blur",
          },
        ],
        "user.nickName": [
          {
            required: true,
            message: "请输入账号名称",
            trigger: "blur",
          },
        ],
        "user.phonenumber": [
          {
            required: true,
            message: "请输入联系电话",
            trigger: "blur",
          },
          {
            pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
            message: "手机号格式错误",
            trigger: "blur",
          },
        ],
        "user.password": [
          {
            required: true,
            message: "请输入密码,密码长度为5到20之间",
            trigger: "blur",
          },
        ],
        "user.email": [
          {
            required: true,
            message: "请输入邮箱",
            trigger: "blur",
          },
        ],
        "user.code": [
          {
            required: true,
            message: "请输入验证码",
            trigger: "blur",
          },
        ],
      },
    };
  },
  computed: {},
  watch: {},
  mounted() {},
  methods: {
    //通过输入的电子邮箱，发送验证码
    async getCodeFun() {
      this.$refs.elForm.validateField("user.email", (result) => {
        if (!result) {
          // 按钮倒计时
          this.disabled = true;
          this.msg = this.count-- + "s后重新获取";
          this.timer = setInterval(() => {
            this.msg = this.count-- + "s后重新获取";
            if (this.count < 0) {
              this.msg = "点击获取验证码";
              this.count = 60;
              this.disabled = false;
              clearInterval(this.timer);
            }
          }, 1000);

          // 发送验证码请求
          this.emailJson.email = this.formData.user.email;
          this.EmailCode.email = this.formData.user.email;
          getRequestPermissionCode(this.emailJson).then((res) => {
            this.EmailCode.permissionCode = res.data;
            sendEmailCode(this.EmailCode).then((res) => {
              if (res.code === 200) {
                this.$modal.msgSuccess(res.msg);
              } 
            });
          });
        }
      });
    },

    //提交表单
    submitForm() {
      this.$refs["elForm"].validate((valid) => {
        if (valid) {
          registerUser(this.formData.user).then((response) => {
            if (response.code === 200) {
              this.$message.success("您已经成功注册账号,请尝试登录吧！！！");
              this.$router.push("/recruit/f/login");
            } else {
              this.$message.error(response.msg);
            }
          });
        }
      });
    },
    resetForm() {
      this.$refs["elForm"].resetFields();
    },
  },
};
</script>
<style scoped>
.title {
  color: #6a637b;
  font-size: 30px;
  font-weight: 900;
  margin-right: 50px;
  text-align: center;
}

.el-upload__tip {
  line-height: 1.2;
}
.form-wrap {
  padding: 30px;
  width: 50%;
  margin: 50px auto 0;
  background: #fff;
  box-shadow: 0 6px 13px 0 rgba(0, 0, 0, 0.1);
  border-radius: 10px;
}

.background{
  background-image: url(https://static.zhipin.com/zhipin-geek/v364/web/geek/images/newbg.png);
	background-repeat:no-repeat;
  height: 95vh;
  overflow: hidden;
  background-color: rgb(93, 213, 200);
  background-position: center bottom;
  background-size: 100%;
}
</style>
</style>
