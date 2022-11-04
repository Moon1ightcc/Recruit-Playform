<template>
  <div class="app-container home">
    <el-row :gutter="20">
      <el-col :sm="24" :lg="12" style="padding-left: 20px">
        <h2>EKKO招聘管理系统</h2>
        <p>欢迎来到后台管理界面！！！</p>
        <p>
          <b>当前版本:</b> <span>v{{ version }}</span>
        </p>
      </el-col>
    </el-row>
    <el-divider />
    <div v-if="!isCompany" class="chart-container">
      <div id="chartPie" class="chart" style="height: 500px; width: 100%"/>
      <div id="positionPie" class="chart" style="height: 500px; width: 100%" />
    </div>
  </div>
</template>

<script>
import echarts from "echarts";
import { getCompanyAddress } from "@/api/echarts/companySta";
import { getpositionCount } from "@/api/echarts/positionSta";

import { mapGetters } from "vuex";

export default {
  name: "index",
  data() {
    return {
      // 版本号
      version: "1.0.0",
      chartPie: "",
      positionPie: "",
      sum: [], // 公司选址城市数量
      companyAddress: [], // 公司选址城市名称
      count: [], // 发布岗位数量
      positionName: [], // 发布岗位名称
    };
  },
  computed: {
    ...mapGetters(["isCompany"]),
  },
  mounted() {
    this.drawCharts();
    this.drawPositionCharts();
    this.initData();
    this.initPositionData();
  },
  methods: {
    drawPositionPie() {
      this.positionPie = echarts.init(document.getElementById("positionPie"));
      this.positionPie.setOption({
        //设置标题,副标题,以及标题位置居中
        title: {
          text: "发布岗位统计",
          //subtext: '纯属虚构',
          x: "center",
        },
        //具体点击某一项触发的样式内容
        tooltip: {
          trigger: "item",
          formatter: "{a} <br/>{b} : {c} ({d}%)",
        },
        //左上侧分类条形符
        legend: {
          orient: "vertical",
          left: "left",
          data: [],
        },
        //饼状图类型以及数据源
        series: [
          {
            name: "统计岗位数量",
            type: "pie",
            //radius: '70%',
            //center: ['50%', '60%'],
            data: [],
            //设置饼状图扇形区域的样式
            itemStyle: {
              emphasis: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: "rgba(0, 0, 0, 0.5)",
              },
            },
          },
        ],
      });
    },
    // 动态获取饼状图的数据
    async initPositionData() {
      getpositionCount().then((res) => {
        console.log(res.data);
        var getPostionData = [];
        // 先进行赋值;
        for (let i = 0; i < res.data.length; i++) {
          var obj = new Object();
          obj.name = res.data[i].positionName;
          obj.value = res.data[i].count;
          getPostionData[i] = obj;
        }
        this.positionPie.setOption({
          legend: {
            data: res.data.positionName,
          },
          series: [
            {
              data: getPostionData,
            },
          ],
        });
      });
    },
    drawPieChart() {
      this.chartPie = echarts.init(document.getElementById("chartPie"));
      this.chartPie.setOption({
        //设置标题,副标题,以及标题位置居中
        title: {
          text: "公司选址统计",
          //subtext: '纯属虚构',
          x: "center",
        },
        //具体点击某一项触发的样式内容
        tooltip: {
          trigger: "item",
          formatter: "{a} <br/>{b} : {c} ({d}%)",
        },
        //左上侧分类条形符
        legend: {
          orient: "vertical",
          left: "left",
          data: [],
        },
        //饼状图类型以及数据源
        series: [
          {
            name: "统计数量",
            type: "pie",
            //radius: '70%',
            //center: ['50%', '60%'],
            data: [],
            //设置饼状图扇形区域的样式
            itemStyle: {
              emphasis: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: "rgba(0, 0, 0, 0.5)",
              },
            },
          },
        ],
      });
    },
    // 动态获取饼状图的数据
    async initData() {
      getCompanyAddress().then((res) => {
        console.log(res.data);
        var getData = [];
        // 先进行赋值;
        for (let i = 0; i < res.data.length; i++) {
          var obj = new Object();
          obj.name = res.data[i].companyAddress;
          obj.value = res.data[i].sum;
          getData[i] = obj;
        }
        this.chartPie.setOption({
          legend: {
            data: res.data.companyAddress,
          },
          series: [
            {
              data: getData,
            },
          ],
        });
      });
    },
    drawCharts() {
      this.drawPieChart();
    },
    drawPositionCharts(){
      this.drawPositionPie();
    }
  },
};
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }
  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;

  ul {
    list-style-type: none;
  }

  h4 {
    margin-top: 0px;
  }

  h2 {
    margin-top: 10px;
    font-size: 26px;
    font-weight: 100;
  }

  p {
    margin-top: 10px;

    b {
      font-weight: 700;
    }
  }

  .update-log {
    ol {
      display: block;
      list-style-type: decimal;
      margin-block-start: 1em;
      margin-block-end: 1em;
      margin-inline-start: 0;
      margin-inline-end: 0;
      padding-inline-start: 40px;
    }
  }

//   #chartPie{
//     margin-left: 120px;
// }

//   #positionPie{
//     margin-right: 120px;
// }

}
</style>

