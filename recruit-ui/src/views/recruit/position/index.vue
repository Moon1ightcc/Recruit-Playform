<template>
  <div class="w">
    <Search />
    <MyContainer>
      <el-row :gutter="12">
        <el-col :span="16">
          <el-card
            v-for="position in positionList"
            shadow="hover"
            :key="position.recruitId"
          >
            <el-row :gutter="12">
              <el-col :span="12">
                <h3>
                  <router-link
                    :to="'/recruit/f/detail/' + position.recruitId"
                    >{{ position.positionName }}</router-link
                  >
                  <el-button
                    style="margin-left: 30px; padding: 3px 0"
                    type="text"
                    >{{ position.minSalary }} -
                    {{ position.maxSalary }}</el-button
                  >
                </h3>
                <p>
                  <span>{{ position.workCity }}</span>
                  <el-tag size="mini">{{
                    position.category.parentCategory
                  }}</el-tag>
                  <el-tag size="mini">{{
                    position.category.positionName
                  }}</el-tag>
                  <br /><br />

                  <span
                    >招聘时间：{{ position.startTime }} --
                    {{ position.deadline }}</span
                  >
                </p>
              </el-col>
              <el-col :span="4" :offset="4">
                <p>
                  <i class="el-icon-s-finance"></i
                  >{{ position.company.companyName }}
                </p>
                <!--                <p><i class="el-icon-s-custom"></i>{{position.hr.name}}</p>-->
              </el-col>
              <el-col :span="4">
                <img :src="position.company.logo" alt="" />
              </el-col>
            </el-row>
          </el-card>
          
          <pagination
            v-show="total > 0"
            :total="total"
            :page.sync="queryParams.pageNum"
            :limit.sync="queryParams.pageSize"
            @pagination="listPosition"
          />
        </el-col>

        <el-col :span="8">
          <Ad />
        </el-col>
      </el-row>
    </MyContainer>
  </div>
</template>

<script>
import Search from "@/views/recruit/components/Search";
import MyContainer from "@/components/Me/MyContainer";
import { listByPositionName } from "@/api/recruit/position";
import Ad from "@/views/recruit/components/Ad";
export default {
  name: "Position",
  components: { Ad, MyContainer, Search },
  data() {
    return {
      // 查询参数
      // 总条数
      total: 0,
      queryParams: {
        pageNum: 1,
        pageSize: 5,
      },
      positionList: [],
    };
  },
  methods: {
    listPosition() {
      listByPositionName(this.queryParams).then((response) => {
        this.positionList = response.rows;
        this.total = response.total;
        this.positionList.forEach((value) => {
          console.log(JSON.stringify(value.category));
        });
      });
    },
  },
  created() {
    this.listPosition();
  },
};
</script>

<style scoped lang="scss">
.w {
  background-color: rgb(246, 246, 248);
  .el-card {
    p {
      span {
        font-size: 13px;
        color: #8d92a1;
        margin-right: 10px;
      }
      .el-tag {
        margin-right: 10px;
      }
    }
    img {
      width: 100%;
    }
  }
}
</style>
