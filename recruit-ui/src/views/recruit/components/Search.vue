<template>
  <div class="wrapper">
    <MyContainer :span="14">
      <el-input placeholder="默认通过岗位名称搜索(可选择通过公司搜索)" v-model="searchContent">
        <el-select v-model="select" slot="prepend" placeholder="请选择">
          <el-option
            v-for="item in selection"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          ></el-option>
        </el-select>
        <template slot="append">
          <el-button
            v-if="select!='公司'"
            @click="toSearchByPositionName(searchContent)"
            icon="el-icon-search"
            >搜索</el-button
          >
        <el-button
            v-if="select=='公司'"
            @click="toSearchByCompanyName(searchContent)"
            icon="el-icon-search"
            >搜索</el-button
          >
          <!-- <el-button  @click="toSearch(positionName)" icon="el-icon-search">搜索</el-button> -->
        </template>
      </el-input>
    </MyContainer>
  </div>
</template>

<script>
import MyContainer from "@/components/Me/MyContainer";
export default {
  name: "Search",
  components: { MyContainer },
  data() {
    return {
      select: "",
      searchContent: "",
      selection: [
        { lable: "1", value: "公司" },
        { lable: "2", value: "岗位" },
      ],
    };
  },
  methods: {
    toSearchByPositionName(searchContent) {
      this.$router.push({ path: "/recruit/f/result", query: { searchContent } });
    },
    toSearchByCompanyName(searchContent){
      this.$router.push({ path: "/recruit/f/companyName", query: { searchContent } });
    }
  },
};
</script>

<style scoped lang="scss">
.wrapper {
  background-color: #fff;
}
.el-select {
  width: 100px;
}
.el-input {
  margin-top: 40px;
  margin-bottom: 40px;
}
.el-button {
  color: #409eff !important;
  font-weight: bold;
}
</style>
