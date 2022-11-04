<template>
  <MyContainer>
    <el-card v-for="delivery in deliveryList" :key="delivery.deliveryId">
      <div slot="header" class="clearfix">
        <span>{{ delivery.positionName }}</span>
        <el-button
          @click="delDelivery(delivery.deliveryId)"
          style="float: right; padding: 3px 0"
          type="text"
          icon="el-icon-delete"
          >删除</el-button
        >
      </div>
      <div>
        <el-row :gutter="12">
          <el-col :span="4">
            <!--            <img :src="delivery.company.logo" alt="">-->
          </el-col>
          <el-col :span="4">
            <p><i class="el-icon-s-finance"></i>{{ delivery.companyName }}</p>
          </el-col>
          <el-col :span="4">
            <p>
              薪资：<el-button style="padding: 3px 0" type="text">
                {{ delivery.position.minSalary }} -
                {{ delivery.position.maxSalary }}
              </el-button>
            </p>
          </el-col>
          <el-col :span="7">
            <p>
              招聘时间：{{ delivery.position.startTime }} --{{
                delivery.position.deadline
              }}
            </p>
          </el-col>
          <el-col :span="4" style="padding: 10px 0">
            <el-tag v-if="delivery.deliveryStatus == 0" type="info">
              {{ statusFormat(delivery.deliveryStatus) }}
            </el-tag>
            <el-tag v-if="delivery.deliveryStatus == 1" type="success">
              {{ statusFormat(delivery.deliveryStatus) }}
            </el-tag>
            <el-tag v-if="delivery.deliveryStatus == 2" type="danger">
              {{ statusFormat(delivery.deliveryStatus) }}
            </el-tag>
          </el-col>
        </el-row>
      </div>
    </el-card>
    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="listDelivery"
    />
  </MyContainer>
</template>

<script>
import MyContainer from "@/components/Me/MyContainer";
import { mapGetters } from "vuex";
import { delDelivery, listDeliveryNickName } from "@/api/recruit/delivery";
import { listUser } from "@/api/system/user";

export default {
  name: "Delivery",
  components: { MyContainer },
  data() {
    return {
      deliveryList: [],
      // 0：未处理，1：通过，2：拒绝 状态字典
      statusOptions: [],
      user: {},
      total: 0,
      queryParams: {
        pageNum: 1,
        pageSize: 5,
      },
    };
  },
  computed: {
    ...mapGetters(["name", "avatar"]),
  },
  methods: {
    async listDelivery() {
      await listUser({ userName: this.name }).then((res) => {
        this.user = res.rows[0];
        listDeliveryNickName({ nickName: this.user.nickName }).then((res) => {
          this.deliveryList = res.rows;
          this.total = res.total;
        });
      });
    },
    delDelivery(id) {
      this.$confirm("确定需要取消投递简历吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      }).then(() => {
        delDelivery(id).then((res) => {
          this.$modal.msgSuccess("简历取消投递成功");
          this.listDelivery();
        });
      });
    },
    // 0：未处理，1：通过，2：拒绝字典翻译
    statusFormat(value) {
      return this.selectDictLabel(this.statusOptions, value);
    },
  },
  created() {
    this.getDicts("rct_delivery_status").then((response) => {
      this.statusOptions = response.data;
    });
    this.listDelivery();
  },
};
</script>

<style scoped>
img {
  height: 80px;
}
</style>
