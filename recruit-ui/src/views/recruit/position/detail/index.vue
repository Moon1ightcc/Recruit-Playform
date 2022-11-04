<template>
  <div>
    <div class="brand">
      <MyContainer v-if="position && position.category">
        <el-row :gutter="12">
          <el-col :span="16">
            <h1 class="title1">岗位正在招聘中.....</h1>
            <h1>{{ position.positionName }}</h1>
            <p>
              <span>{{ position.workCity }} </span>
              <el-button style="margin-left: 30px; padding: 3px 0" type="text"
                >{{ position.minSalary }} -
                {{ position.maxSalary }}
              </el-button>
            </p>
            <p>
              <el-tag size="mini"
                >{{ position.category.parentCategory }}
              </el-tag>
              &nbsp; &nbsp;

              <el-tag size="mini">{{ position.category.positionName }}</el-tag>
            </p>
          </el-col>
          <el-col :span="8">
            <el-button
              v-if="!isExist"
              class="resume"
              type="primary"
              @click="sendResume"
              style="width: 100%; margin: 140px 0"
              >{{ resumeText }}</el-button
            >
            <el-button
              v-if="isExist"
              class="resume"
              type="danger"
              @click="cancelResume"
              style="width: 100%; margin: 140px 0"
              >{{ resumeText }}</el-button
            >

            <!--            <router-link to="/recruit/f/chat">-->
            <!--            </router-link>-->
          </el-col>
        </el-row>
      </MyContainer>
    </div>
    <MyContainer>
      <el-row :gutter="12">
        <el-col :span="16">
          <el-tabs v-model="tab">
            <el-tab-pane label="职位要求" name="tab" v-html="position.requirement"></el-tab-pane>
          </el-tabs>
        </el-col>
        <el-col v-if="position.company" :span="8" style="text-align: center">
          <img :src="position.company.logo" alt="" style="width: 80%" />
          <p>
            <span
              ><i class="el-icon-s-finance"></i
              >{{ position.company.companyName }}</span
            >
            <!--            <span><i class="el-icon-s-custom"></i>{{ position.hr.name }}</span>-->
          </p>
          <p>招聘时间：{{ position.startTime }} -- {{ position.deadline }}</p>
          <p>
            {{ position.company.remark }}
          </p>
          <Ad />
        </el-col>
      </el-row>
    </MyContainer>
  </div>
</template>

<script>
import { getPositionInfoVo } from "@/api/recruit/position";
import MyContainer from "@/components/Me/MyContainer";
import Ad from "@/views/recruit/components/Ad";
import {
  addDeliveryVo,
  listDelievryByParams,
  delDelivery,
} from "@/api/recruit/delivery";
import { mapGetters } from "vuex";
import { getUserProfile } from "@/api/system/user";


export default {
  name: "Detail",
  components: { Ad, MyContainer },
  data() {
    return {
      tab: "tab",
      position: {},
      user: {},
      deliveryStatus: "0",
      resumeText: "发送简历",
      isExist: false,
      queryParams: {},
      deliveryVo: {},
      total: 0,
    };
  },
  computed: {
    ...mapGetters(["userId", "name", "avatar"]),
  },
  methods: {

    async getOne() {
      await getPositionInfoVo(this.$route.params.id).then((res) => {
        this.position = res.data;
        this.queryParams.userId = this.userId;
        this.queryParams.companyName = this.position.company.companyName;
        this.queryParams.positionName = this.position.positionName;
        listDelievryByParams({
          positionName: this.queryParams.positionName,
          companyName: this.queryParams.companyName,
          nickName: this.user.nickName,
        }).then((response) => {
          this.deliveryVo = response.data[0];
          if (this.deliveryVo != null) {
            this.total = 1;
          }
          if (this.total != 0) {
            this.isExist = true;
            this.resumeText = "取消投递简历";
          }
        });
      });
    },
    sendResume() {
      addDeliveryVo({
        positionId: this.position.recruitId,
        positionName: this.position.positionName,
        companyId: this.position.companyId,
        companyName: this.position.company.companyName,
        userId: this.userId,
        nickName: this.user.nickName,
        deliveryStatus: this.deliveryStatus,
      }).then(() => {
        this.$modal.msgSuccess("简历已经成功发送");
        this.resumeText = "取消发送";
        this.isExist = true;
      });
    },
    cancelResume() {
      this.$confirm("确定需要取消投递简历吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      }).then(() => {
        delDelivery(this.deliveryVo.deliveryId).then(() => {
          this.$modal.msgSuccess("简历已经取消投递成功");
          this.resumeText = "投递简历";
          this.isExist = false;
        });
      });
    },
    getUser() {
      getUserProfile().then((response) => {
        this.user = response.data;
      });
    },
  },
  created() {
    this.getOne();
    this.getUser();
  },
};
</script>

<style scoped>
.brand {
  height: 300px;
  color: white;
  background-color: rgb(66, 74, 95);
}

.title1 {
  color: #db75c27d;
}
</style>
