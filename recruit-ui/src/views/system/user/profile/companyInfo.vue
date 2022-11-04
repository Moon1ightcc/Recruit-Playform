<template>
  <el-row>
    <el-col :span="12">
      <el-form ref="form" :model="form" label-width="100px">
        <el-form-item label="公司Logo" prop="Logo">
          <image-upload v-model="form.logo" />
        </el-form-item>
        <el-form-item label="营业执照" prop="license">
          <image-upload v-model="form.license" />
        </el-form-item>
      </el-form>
      <span style="display: block; text-align: center">
        <el-button type="primary"  size="mini" @click="submitForm">保 存</el-button>
        <el-button type="danger" size="mini" @click="close">关 闭</el-button>
      </span>
    </el-col>
    <el-col :span="12">
      <el-alert
        v-if="statusList[company.status] == '审核通过'"
        :title="statusList[company.status]"
        type="success"
      >
      </el-alert>
      <el-alert
        v-if="statusList[company.status] == '未审核'"
        :title="statusList[company.status]"
        type="warning"
      >
      </el-alert>
      <el-alert
        v-if="statusList[company.status] == '审核失败'"
        :title="statusList[company.status]"
        type="error"
      >
      </el-alert>
      <el-alert
        v-if="statusList[company.status] == '审核中'"
        :title="statusList[company.status]"
        type="info"
      >
      </el-alert>
      <h2>温馨提示:</h2>
      <p>重新上传Logo或者营业执照将会重新审核！</p>
    </el-col>
  </el-row>
</template>

<script>
import ImageUpload from "@/components/ImageUpload";
import { listCompany, updateCompany } from "@/api/recruit/company";
import { mapGetters } from "vuex";

export default {
  name: "companyInfo",
  components: { ImageUpload },
  data() {
    return {
      form: {
        logo: "",
        license: "",
        userId: "",
        status: "",
        companyId: "",
      },
      statusList: ["未认证", "审核中", "审核通过", "审核失败"],
      company: {
        logo: "",
        license: "",
        companyId: "",
      },
    };
  },
  computed: {
    ...mapGetters(["userId"]),
  },
  created() {
    listCompany({ userId: this.userId }).then((res) => {
      this.company = res.rows[0];
      this.form.logo = this.company.logo;
      this.form.license = this.company.license;
      this.form.companyId = this.company.companyId
      this.form.userId = this.userId;
      this.form.status = this.status;
    });
  },
 methods: {
    /** 提交按钮 */
    submitForm() {
      // 若是重新上传需要管理员再次审核,将status设置为未认证状态
      this.form.status = 1;
      updateCompany(this.form).then((response) => {
        this.alertMsg(response.msg);
        location.reload();
      });
    },
    alertMsg(msg) {
      this.$alert("修改成功！请等待管理员审核！", msg, {
        confirmButtonText: "确定",
      });
    },
    close() {
      this.$tab.closePage();
    }
  },
};
</script>

<style scoped>
</style>
