<template>
  <MyContainer>
    <div class="job-nav">
      <div class="mainNav">
        <div class="menu_box" v-for="(item,index) in items" @mouseover="selectStyle(index) " @mouseout="outStyle()" :key="item.positionId">
          <div class="menu_main">
            <div class="category-list">
              <h4>{{ item.positionName }}</h4>
            </div>
          </div>
          <div class="menu_sub" v-show="activeIndex===index">
            <dl v-for="item in items[index].children" :key="item.positionId">
              <dd>
                <a @click="toSearch(item.positionName)">{{ item.positionName }}</a>
              </dd>
            </dl>
          </div>
        </div>
      </div>
    </div>
    <el-carousel  height="360px">
      <el-carousel-item>
        <img src="@/assets/images/banner1.jpeg" class="background-images-index">
      </el-carousel-item>
      <el-carousel-item>
        <img src="@/assets/images/banner2.jpeg" class="background-images-index">
      </el-carousel-item>
      <el-carousel-item>
        <img src="@/assets/images/banner3.jpeg" class="background-images-index">
      </el-carousel-item>
    </el-carousel>

    <Position/>

  </MyContainer>
</template>

<script>
import MyContainer from '@/components/Me/MyContainer'
import Position from '@/views/recruit/indexChild/hot/position'
import { listBigCategory} from '@/api/recruit/category'

export default {
  name: 'IndexMain',
  components: { Position, MyContainer },
  data() {
    return {
      activeIndex: -1,
      items: [],
      queryParams:{},
    }
  },
  methods: {
    selectStyle(index) {
      this.activeIndex = index
    },
    outStyle() {
      this.activeIndex = -1
    },
    listBigCategory() {
      listBigCategory().then(res=>{
        this.items=res.data
      })
    },
    toSearch(positionName){
      let searchContent = positionName
      this.$router.push({path:'/recruit/f/result',query: {searchContent}})
    },
  },
  created() {
    this.listBigCategory()
  }
}
</script>

<style scoped>
.job-nav .mainNav {
  float: left;
  position: relative;
  width: 321px;
  margin-left: -15px;
}

.job-nav .mainNav .menu_box {
  position: relative;
  padding: 18px 0 17px;
}

.job-nav .mainNav .menu_box:hover {
  box-shadow: 0 0 4px 2px rgba(0, 0, 0, 0.09);
  border-top-left-radius: 2px;
  border-bottom-left-radius: 2px;
  background: #fff;
  z-index: 500;
}

.job-nav .mainNav .menu_box .menu_main {
  position: relative;
  height: 20px;
  line-height: 20px;
  overflow: hidden;
  border-right: 0;
}

.job-nav .mainNav .menu_box .menu_main .category-list h4 {
  display: inline !important;
  padding-left: 15px;
  margin: 0;
  font-size: 18px;
  font-weight: 500;
}

.job-nav .mainNav .menu_box .menu_main .category-list a {
  color: #555;
  display: inline-block;
  margin: 0 5px 5px 0;
  padding: 0 8px;
  white-space: nowrap;
}

.job-nav .mainNav .menu_box .menu_main .category-list a:hover {
  color: #6aa2e4;
}

.job-nav .mainNav .menu_box .menu_sub {
  position: absolute;
  left: 321px;
  top: 0;
  width: 300px;
  padding: 20px 10px 0 12px;
  z-index: 10;
  background: #fff;
  -webkit-box-shadow: 0 0 4px 2px rgba(0, 0, 0, .09);
  -moz-box-shadow: 0 0 4px 2px rgba(0, 0, 0, .09);
  box-shadow: 0 0 4px 2px rgba(0, 0, 0, .09);
  border-radius: 0 2px 2px 2px;
}

.job-nav .mainNav .menu_box .menu_sub dt {
  position: relative;
  width: 70px;
  padding-left: 10px;
  font-size: 14px;
  line-height: 20px;
  margin: 0 0 6px;
}

.job-nav .mainNav .menu_box .menu_sub dt span {
  position: relative;
  display: inline-block;
  padding: 0;
  color: #333;
}

.job-nav .mainNav .menu_box .menu_sub dd {
  color: #555;
}

.job-nav .mainNav .menu_box .menu_sub dd a {
  display: inline-block;
  position: relative;
  margin-left: -1px;
  padding: 0 11px;
  font-size: 14px;
  line-height: 28px;
  color: #777;
  white-space: nowrap;
}

.job-nav .mainNav .menu_box .menu_sub dd a:hover {
  color: #648fcc;
  text-decoration: underline;
}

.background-images-index{
  width: 100%;
  height: 100%;
}
</style>
