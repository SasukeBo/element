<template>
  <div class="l-con--card">
    <div class="l-card--title">
      产品动态
      <indicators :count="3" :currentActive="activeIndex" @selected="selectIndicator"></indicators>
    </div>

    <div class="l-card--body">
      <el-carousel
        class="u-dongtai"
        height="60px"
        arrow="never"
        @change="changeIndecatorIndex"
        indicator-position="none"
        ref="dongtai"
      >
        <el-carousel-item v-for="(page, index) in pages" :key="'page' + index">
          <a :href="page.url" class="l-dongtai--page" :style="{ background: page.background }">{{ page.text }}</a>
        </el-carousel-item>
      </el-carousel>
    </div>
  </div>
</template>
<script>
import Indicators from './_indicators';

export default {
  components: {
    Indicators
  },

  data() {
    return {
      activeIndex: 0,
      pages: [
        { url: 'https://element.eleme.io', text: 'Element基于 Vue 2.0 的桌面端组件库', background: '#FF5722' },
        { url: 'https://cn.vuejs.org', text: 'Vue.js 渐进式 JavaScript 框架', background: '#009688' },
        { url: 'https://github.com/ElemeFE', text: 'ElemeFE 饿了么前端', background: '#1E9FFF' }
      ]
    };
  },

  methods: {
    selectIndicator(index) {
      this.$refs.dongtai.setActiveItem(index - 1);
    },

    changeIndecatorIndex(val) {
      this.activeIndex = val;
    }
  }
};
</script>
<style lang="scss">
@import '~demo-css/demo-vars';

.u-dongtai a.l-dongtai--page {
  display: block;
  color: $--color-font-white;
  font-size: 14px;
  line-height: 60px;
  text-align: center;
}
</style>
