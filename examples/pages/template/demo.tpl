<template>
  <div class="u-demo">
    <div class="l-demo--left">
      <div class="l-left--title">Elements Demos</div>
      <el-menu
        class="l-left--menu"
        :unique-opened="true"
        default-active="demo-zh-CNconsole"
        background-color="#333"
        text-color="#999"
        active-text-color="#fff"
        :collapse="isCollapse"
        @select="handleSelect"
      >
        <el-submenu index="index">
          <template slot="title">
            <i class="el-icon-location"></i>
            <span slot="title">主页</span>
          </template>
          <el-menu-item index="demo-zh-CNconsole">控制台</el-menu-item>
          <el-menu-item index="demo-zh-CNhomepage1">主页1</el-menu-item>
          <el-menu-item index="demo-zh-CNhomepage2">主页2</el-menu-item>
        </el-submenu>
        <el-submenu index="pages">
          <template slot="title">
            <i class="el-icon-view"></i>
            <span slot="title">页面</span>
          </template>
          <el-menu-item index="demo-zh-CNprofile">个人主页</el-menu-item>
        </el-submenu>
        <el-submenu index="application">
          <template slot="title">
            <i class="el-icon-goods"></i>
            <span slot="title">应用</span>
          </template>
        </el-submenu>
        <el-submenu index="advanced">
          <template slot="title">
            <i class="el-icon-menu"></i>
            <span slot="title">高级</span>
          </template>
        </el-submenu>
        <el-submenu index="users">
          <template slot="title">
            <i class="el-icon-service"></i>
            <span slot="title">用户</span>
          </template>
        </el-submenu>
        <el-submenu index="settings">
          <template slot="title">
            <i class="el-icon-setting"></i>
            <span slot="title">设置</span>
          </template>
        </el-submenu>
      </el-menu>
    </div>
    <div class="l-demo--right">
      <div class="l-right--header">
        <div class="header-left">
          <el-button type="text" icon="el-icon-caret-left" @click="isCollapse = !isCollapse"></el-button>
          <el-button type="text" icon="el-icon-location" @click="$router.push('/zh-CN')"></el-button>
          <el-button type="text" icon="el-icon-refresh"></el-button>
          <el-input class="header-search" placeholder="搜索..."></el-input>
        </div>

        <div class="header-right">
          <el-button type="text" icon="el-icon-upload"></el-button>
          <el-button type="text" icon="el-icon-picture"></el-button>
          <el-button type="text" icon="el-icon-edit"></el-button>
          <el-button type="text" icon="el-icon-menu"></el-button>

          <el-menu mode="horizontal">
            <el-submenu index="r-1">
              <template slot="title">Sasuke</template>
              <el-menu-item index="r-1-1">基本资料</el-menu-item>
              <el-menu-item index="r-1-2">修改密码</el-menu-item>
              <el-menu-item index="r-1-3">退出</el-menu-item>
            </el-submenu>
          </el-menu>
          <el-button type="text" icon="el-icon-more"></el-button>
        </div>
      </div>

      <div class="l-right--body">
        <router-view></router-view>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      isCollapse: false
    };
  },

  mounted() {
    document.body.classList.add('is-component');
  },

  destroyed() {
    document.body.classList.remove('is-component');
  },

  methods: {
    handleSelect(name) {
      this.$router.push({ name });
    }
  }
};
</script>
<style lang="scss">
@import '~demo-css/demo-vars.scss';

.u-demo {
  position: relative;
  background: $--color-background-light3;
  margin-top: 49px;
  height: calc(100% - 49px);
  overflow: hidden;

  .l-demo--left {
    position: fixed;
    z-index: 2019;
    width: 220px;
    height: 100%;
    overflow: hidden;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;

    .l-left--title {
      height: 49px;
      background: $--color-background-dark;
      color: $--color-font-white;
      text-align: center;
      line-height: 49px;
      font-weight: bold;
      border-bottom: 1px solid $dark;
    }

    .l-left--menu {
      height: 100%;
      overflow: scroll;
    }

    .l-left--menu:not(.el-menu--collapse) {
      width: 220px;
    }
  }

  .l-demo--right {
    padding-left: 220px;
    position: relative;
    height: 100%;

    .l-right--header {
      z-index: 2019;
      position: fixed;
      background: $--color-background-white;
      top: 0;
      right: 0;
      left: 220px;
      height: 49px;
      box-shadow: $--box-shadow-primary;
    }

    .header-left {
      float: left;
      height: 49px;
      padding: 0 10px;
    }

    .l-right--header button {
      height: 100%;
      color: $--color-font-black;
      margin: 0 20px;
      font-size: 16px;
    }

    .header-search {
      width: 200px;
      height: 100%;
      position: absolute;
      margin: auto 20px;
    }

    .header-search input {
      border: none;
      height: 100%;
    }

    .header-right {
      float: right;
      height: 49px;

      .el-menu {
        border: none;
      }
    }

    .header-right button,
    .header-right ul {
      float: left;
    }

    .l-right--header .el-menu--horizontal>.el-submenu .el-submenu__title {
      height: 49px;
      line-height: 49px;
    }

    .l-right--body {
      height: 100%;
      overflow: scroll;
    }
  }
}
</style>

