<template>
  <MyContainer>
    <el-row :gutter="20">
      <el-col :span="6" :xs="24">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>个人信息</span>
          </div>
          <div>
            <div class="text-center">
              <userAvatar :user="user" />
            </div>
            <ul class="list-group list-group-striped">
              <li class="list-group-item">
                <svg-icon icon-class="user" />用户名
                <div class="pull-right">{{ user.userName }}</div>
              </li>
              <li class="list-group-item">
                <svg-icon icon-class="phone" />手机号码
                <div class="pull-right">{{ user.phonenumber }}</div>
              </li>
              <li class="list-group-item">
                <svg-icon icon-class="email" />用户邮箱
                <div class="pull-right">{{ user.email }}</div>
              </li>
              <li class="list-group-item">
                <svg-icon icon-class="peoples" />角色
                <div class="pull-right">{{ roleGroup }}</div>
              </li>
              <li class="list-group-item">
                <svg-icon icon-class="date" />注册日期
                <div class="pull-right">{{ user.createTime }}</div>
              </li>
            </ul>
          </div>
        </el-card>
      </el-col>
      <el-col :span="18" :xs="24">
        <el-card>
          <div slot="header" class="clearfix">
            <span>基本资料</span>
          </div>
          <el-tabs v-model="activeTab">
            <el-tab-pane label="基本资料" name="userinfo">
              <userInfo :user="user" />
            </el-tab-pane>
            <el-tab-pane label="修改密码" name="resetPwd">
              <resetPwd :user="user" />
            </el-tab-pane>
            <el-tab-pane label="简历信息" name="resumeInfo">
              <el-form ref="form" label-width="80px">
                <el-form-item label="姓名">
                  <el-input
                    v-model="resume.nickName"
                    placeholder="请输入姓名"
                  />
                </el-form-item>
                <el-form-item label="性别">
                  <el-select
                    v-model="resume.sex"
                    placeholder="请选择性别"
                    class="select"
                  >
                    <el-option
                      v-for="dict in sexOptions"
                      :key="dict.dictValue"
                      :label="dict.dictLabel"
                      :value="dict.dictValue"
                    ></el-option>
                  </el-select>
                </el-form-item>
                <el-form-item label="政治面貌">
                  <!-- <el-input v-model="resume.politicsStatus" placeholder="请输入政治面貌" /> -->
                  <el-select
                    class="select"
                    v-model="resume.politicsStatus"
                    placeholder="请选择政治面貌"
                  >
                    <el-option
                      v-for="dict in dict.type.rct_politics_type"
                      :key="dict.value"
                      :label="dict.label"
                      :value="dict.value"
                    ></el-option>
                  </el-select>
                </el-form-item>
                <el-form-item label="最高学历">
                  <el-select
                    class="select"
                    v-model="resume.education"
                    placeholder="请输入最高学历"
                  >
                    <el-option
                      v-for="dict in dict.type.sys_education_type"
                      :key="dict.value"
                      :label="dict.label"
                      :value="dict.value"
                    ></el-option>
                  </el-select>
                </el-form-item>
                <el-form-item label="健康状况">
                  <!-- <el-input
                    v-model="resume.health"
                    placeholder="请输入健康状况"
                  /> -->
                  <el-select
                    class="select"
                    v-model="resume.healthStatus"
                    placeholder="请选择健康状态"
                    clearable
                  >
                    <el-option
                      v-for="dict in dict.type.rct_health_status"
                      :key="dict.value"
                      :label="dict.label"
                      :value="dict.value"
                    />
                  </el-select>
                </el-form-item>
                <el-form-item label="求职意向">
                  <el-input
                    v-model="resume.jobIntention"
                    placeholder="请输入求职意向"
                  />
                </el-form-item>
                <el-form-item label="生日" prop="birthday">
                  <el-date-picker
                    size="large"
                    clearable
                    v-model="resume.birthday"
                    type="date"
                    value-format="yyyy-MM-dd"
                    placeholder="请选择生日"
                  >
                  </el-date-picker>
                </el-form-item>
                <el-form-item label="所学专业">
                  <el-input
                    v-model="resume.major"
                    placeholder="请输入所学专业"
                  />
                </el-form-item>
                <el-form-item label="现居住地">
                  <el-input
                    v-model="resume.presentAddress"
                    placeholder="请输入现居住地"
                  />
                </el-form-item>
                <el-form-item label="联系电话">
                  <el-input
                    v-model="resume.phone"
                    placeholder="请输入联系电话"
                  />
                </el-form-item>
                <el-form-item label="邮箱">
                  <el-input v-model="resume.email" placeholder="请输入邮箱" />
                </el-form-item>
                <el-form-item label="所获奖项">
                  <el-input
                    v-model="resume.award"
                    placeholder="请输入所获奖项"
                  />
                </el-form-item>
                <el-form-item label="自我评价">
                  <el-input
                    v-model="resume.selfEvaluation"
                    placeholder="请输入自我评价"
                  />
                </el-form-item>
                <el-form-item>
                  <el-button type="primary" size="mini" @click="submit"
                    >保存</el-button
                  >
                </el-form-item>
              </el-form>
            </el-tab-pane>
            <el-tab-pane label="简历附件" name="resumeFile">
              <!-- <FileUpload v-model="resume.url" @resumeFile="resumeFile" /> -->
              <file-upload
                v-model="resume.resumeFile"
                @resumeFile="resumeFile"
              />
            </el-tab-pane>
          </el-tabs>
        </el-card>
      </el-col>
    </el-row>
  </MyContainer>
</template>

<style>
.select {
  width: 725px;
}
</style>

<script>
import userInfo from "@/views/system/user/profile/userInfo";
import resetPwd from "@/views/system/user/profile/resetPwd";
import userAvatar from "@/views/system/user/profile/userAvatar";
import FileUpload from "@/components/FileUpload";
import { getUserProfile } from "@/api/system/user";
import MyContainer from "@/components/Me/MyContainer";
import { addResume, listResume, updateResume } from "@/api/recruit/resume";
import { mapGetters } from "vuex";
export default {
  name: "Resume",
  dicts: ["rct_politics_type", "sys_education_type", "rct_health_status"],
  components: { MyContainer, userAvatar, FileUpload, userInfo, resetPwd },
  data() {
    return {
      user: {},
      roleGroup: {},
      resume: {},
      // 性别字典
      sexOptions: [],
      activeTab: "userinfo",
    };
  },
  created() {
    this.getDicts("sys_user_sex").then((response) => {
      this.sexOptions = response.data;
    });
    this.getUser();
  },
  computed: {
    ...mapGetters(["userId", "name", "avatar"]),
  },
  methods: {
    resumeFile(res) {
      updateResume({
        resumeId: this.resume.resumeId,
        resumeFile: res.fileName,
      }).then((res) => {
        console.log(res);
      });
    },
    // 性别字典翻译
    sexFormat(value) {
      return this.selectDictLabel(this.sexOptions, value);
    },
    submit() {
      if (this.resume.resumeId) {
        // 如果有简历信息，则修改原有简历信息
        updateResume(this.resume).then((res) => {
          this.$modal.msgSuccess("修改简历成功");
        });
      } else {
        // 如果没有简历信息，判断为第一次生成简历
        this.resume.userId = this.userId;
        addResume(this.resume).then((res) => {
          this.$modal.msgSuccess("生成简历成功");
        });
      }
    },
    getUser() {
      getUserProfile().then((response) => {
        this.user = response.data;
        this.roleGroup = response.roleGroup;
        this.getResume(this.user.nickName);
      });
    },
    getResume(nickName) {
      listResume({ nickName }).then((res) => {
        if (res.rows[0]) {
          this.resume = res.rows[0];
        } else {
          this.resume.nickName = nickName;
        }
      });
    },
  },
};
</script>


