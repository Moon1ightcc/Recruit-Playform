<template>
  <MyContainer>
    <el-row :gutter="12">
      <el-col
        v-for="position in positionList"
        :span="8"
        :key="position.recruitId"
      >
        <el-card shadow="hover">
          <div slot="header" class="clearfix">
            <router-link :to="'/recruit/f/detail/' + position.recruitId">{{
              position.positionName
            }}</router-link>
            <el-button style="float: right; padding: 3px 0" type="text"
              >{{ position.minSalary }} - {{ position.maxSalary }}</el-button
            >
            <p>
              <span>{{ position.workCity }}</span>
              <el-tag size="mini">{{
                position.category.parentCategory
              }}</el-tag>
              <el-tag size="mini">{{ position.category.positionName }}</el-tag>
            </p>
          </div>
          <el-row :gutter="12">
            <el-col :span="2">
              <img :src="position.company.logo" alt="" />
            </el-col>
            <el-col :span="14">{{ position.company.companyName }}</el-col>
          </el-row>
        </el-card>
      </el-col>
    </el-row>
    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="search"
    />
  </MyContainer>
</template>

<script>
import MyContainer from "@/components/Me/MyContainer";
import { listByCompanyName } from "@/api/recruit/position";

export default {
  name: "Result",
  components: { MyContainer },
  data() {
    return {
      // 查询参数
      // 总条数
      total: 0,
      queryParams: {
        pageNum: 1,
        pageSize: 15,
        companyName: '',
      },
      positionList: [],
    };
  },
  methods: {
    search() {
      this.queryParams.companyName = this.$route.query.searchContent;
      console.log(this.queryParams.companyName)
      listByCompanyName(this.queryParams).then((res) => {
        this.positionList = res.rows;
        this.total = res.total;
      });
    },
  },
  created() {
    this.search();
  },
};
</script>

<style scoped>
.el-card {
  margin-bottom: 10px;
  height: 160px;
}
img {
  width: 100%;
}
p span {
  font-size: 13px;
  color: #8d92a1;
}
p span,
.el-tag {
  margin-right: 10px;
}
</style>
