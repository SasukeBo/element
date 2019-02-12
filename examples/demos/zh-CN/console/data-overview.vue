<template>
  <div class="l-con--card">
    <div class="l-card--title">
      数据概览（后期拓展报表组件）
      <indicators :count="3" @selected="selectIndicator"></indicators>
    </div>
    <div class="l-card--body">
      <el-carousel
        class="u-data-overview"
        height="332px"
        :autoplay="false"
        arrow="never"
        indicator-position="none"
        ref="dataOverview"
      >
        <el-carousel-item v-for="(page, index) in pages" :key="'page' + index">
          <img :src="page.img" style="width: 758px; height: 332px;"/>
        </el-carousel-item>
      </el-carousel>
    </div>
  </div>
</template>
<script>
import Indicators from './_indicators';
import img1 from 'examples/assets/images/今日流量趋势.png';
import img2 from 'examples/assets/images/最近一周新增的用户.png';
import img3 from 'examples/assets/images/浏览器.png';

export default {
  components: {
    Indicators
  },

  data() {
    return {
      pages: [
        { img: img1 },
        { img: img2 },
        { img: img3 }
      ]
    };
  },

  methods: {
    selectIndicator(index) {
      this.$refs.dataOverview.setActiveItem(index - 1);
    }
  }
};
</script>
