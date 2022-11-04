<template>
  <MyContainer :span="17" :right-span="1">
    <el-container>
      <div class="logo">EKKO招聘</div>
      <el-menu
        :default-active="activeIndex"
        mode="horizontal"
        text-color="#eee"
        active-text-color="#ffd04b"
        background-color="#000"
      >
        <el-menu-item
          v-for="(item, index) in items[0]"
          :index="index + ''"
          @click="changeMenu(index)"
          :key="index"
        >
          {{ item }}
        </el-menu-item>
        <template v-if="name">
          <el-menu-item
            v-for="(item, index) in items[1]"
            :index="index + items[0].length + ''"
            @click="changeMenu(index + items[0].length)"
            :key="item.index"
          >
            {{ item }}
          </el-menu-item>
        </template>
        <template v-if="!name">
          <el-menu-item
            v-for="(item, index) in items[2]"
            :index="index + items[0].length + items[1].length + ''"
            @click="changeMenu(index + items[0].length + items[1].length)"
            :key="item.index"
          >
            {{ item }}
          </el-menu-item>
        </template>
        <template v-if="!name">
          <el-menu-item
            v-for="(item, index) in items[3]"
            :index="index + items[0].length + items[1].length + items[2].length + ''"
            @click="changeMenu(index + items[0].length + items[1].length + items[2].length)"
            :key="item.index"
          >
            {{ item }}
          </el-menu-item>
        </template>
      </el-menu>
    </el-container>
    <div slot="right" v-if="name">
      <el-dropdown
        class="avatar-container right-menu-item hover-effect"
        trigger="click"
      >
        <div class="avatar-wrapper">
          <img :src="avatar" class="user-avatar" />
          <i class="el-icon-caret-bottom" />
        </div>
        <el-dropdown-menu slot="dropdown">
          <router-link to="/recruit/f/resume">
            <el-dropdown-item>个人中心</el-dropdown-item>
          </router-link>
          <el-dropdown-item divided @click.native="logout">
            <span>退出登录</span>
          </el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>
  </MyContainer>
</template>

<script>
import MyContainer from "@/components/Me/MyContainer";
import { mapGetters } from "vuex";
export default {
  name: "Nav",
  components: { MyContainer },
  data() {
    return {
      activeIndex: "0",
      items: [
        ["首页", "岗位"],
        ["投递信息", "个人信息"],
        ["企业注册","用户注册"],
        ["登录"]
      ],
      navTos: [
        "/recruit/f/index",
        "/recruit/f/position",
        "/recruit/f/delivery",
        "/recruit/f/resume",
        "/recruit/f/registerComapny",
        "/recruit/f/registerUser",
        "/recruit/f/login"
      ],
    };
  },
  computed: {
    ...mapGetters(["name", "avatar"]),
  },
  methods: {
    changeMenu(index) {
      this.activeIndex = index + "";
      this.$router.push(this.navTos[index]);
    },
    logout() {
      this.$confirm("确定注销并退出系统吗？", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      }).then(() => {
        this.$store.dispatch("LogOut").then(() => {
          location.href = "/recruit/index";
        });
      });
    },
  },
};
</script>

<style scoped lang="scss">
.el-row {
  background-color: #000;
}
.logo {
  color: #409eff;
  font-size: 30px;
  font-weight: 900;
  margin-right: 20px;
}
.right-menu-item {
  display: inline-block;
  padding: 0 8px;
  height: 100%;
  font-size: 18px;
  color: #5a5e66;
  vertical-align: text-bottom;

  &.hover-effect {
    cursor: pointer;
    transition: background 0.3s;

    &:hover {
      background: rgba(0, 0, 0, 0.025);
    }
  }
}

.avatar-container {
  float: right;
  margin-right: 30px;

  .avatar-wrapper {
    margin-top: 5px;
    position: relative;

    .user-avatar {
      cursor: pointer;
      width: 40px;
      height: 40px;
      border-radius: 10px;
    }

    .el-icon-caret-bottom {
      cursor: pointer;
      position: absolute;
      right: -20px;
      top: 25px;
      font-size: 12px;
    }
  }
}
</style>
