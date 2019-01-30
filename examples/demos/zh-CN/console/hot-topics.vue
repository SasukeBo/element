<template>
  <div class="l-con--card">
    <div class="l-card--title">
      <el-menu :default-active="activeIndex" class="l-title--menu" mode="horizontal" @select="handleSelect">
        <el-menu-item index="HotSearch">今日热搜</el-menu-item>
        <el-menu-item index="HotPost">今日热帖</el-menu-item>
      </el-menu>
    </div>
    <div class="l-card--body">
      <div style="height: 470px;">
        <component :is="currentComponent"></component>
      </div>
    </div>
  </div>
</template>
<script>
import HotSearch from './_hot-search';
import HotPost from './_hot-post';

export default {
  components: {
    HotSearch,
    HotPost
  },

  data() {
    return {
      currentComponent: 'HotSearch',
      activeIndex: 'HotSearch'
    };
  },

  methods: {
    handleSelect(val) {
      this.currentComponent = val;
      console.log(val);
    }
  }
};
</script>
<style lang="scss">
.l-title--menu .el-menu-item {
  height: 42px;
  line-height: 42px;
}
</style>
