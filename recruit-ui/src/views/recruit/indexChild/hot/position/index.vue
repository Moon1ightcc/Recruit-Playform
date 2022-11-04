<template>
  <!--    热门-->
  <div class="wrapper">
    <el-divider><h1>热门职位</h1></el-divider>
    <el-row :gutter="12">
      <el-col v-for="position in positionList" :span="8" style="height: 160px;" :key="position.recruitId">
        <el-card shadow="hover">
          <div slot="header" class="clearfix">
            <router-link :to="'/recruit/f/detail/'+position.recruitId">{{ position.positionName }}</router-link>
            <el-button style="float: right; padding: 3px 0" type="text">{{ position.minSalary }} - {{ position.maxSalary }}</el-button>
            <p>
              <span>{{ position.workCity}}</span>
              <el-tag size="mini">{{ position.category.parentCategory }}</el-tag>
              <el-tag size="mini">{{ position.category.positionName }}</el-tag>
            </p>
          </div>
          <el-row :gutter="12">
            <el-col :span="2">
              <img :src="position.company.logo" alt="">
            </el-col>
            <el-col :span="14">{{position.company.companyName}}</el-col>
          </el-row>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import { listHotPosition } from '@/api/recruit/position'

export default {
  name: 'Position',
  data(){
    return{
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10
      },
      positionList:[],
    }
  },
  methods:{
    listPosition(){
      listHotPosition().then(response => {
        this.positionList = response.data;
      });
    }
  },
  created() {
    this.listPosition()
  }
}
</script>

<style scoped>
.wrapper {
  margin: 40px 0 40px;
}
.el-card {
  margin-bottom: 10px;
}
img {
  width: 100%;
}
p span {
  font-size: 13px;
  color: #8d92a1;
}
p span,.el-tag {
  margin-right: 10px;
}

.iamgess{
  width: 100%;
}


</style>
