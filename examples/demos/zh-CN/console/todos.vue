<template>
  <div class="l-con--card">
    <div class="l-card--title">
      待办事项
      <indicators :count="2" @selected="selectIndicator"></indicators>
    </div>

    <div class="l-card--body">
      <el-carousel
        class="u-todos"
        height="185px"
        :autoplay="false"
        arrow="never"
        indicator-position="none"
        ref="todos"
      >
        <el-carousel-item v-for="(page, index) in pages" :key="'page' + index">
          <div v-for="(item, n) in page" :key="'item' + n" class="l-todos--item">
            <a :href="item.url">
              <div class="l-item--title">{{ item.title }}</div>
              <div :class="['l-item--count', 'page' + index]">{{ item.count }}</div>
            </a>
          </div>
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
      pages: [
        [
          { title: '待审评论', count: 66, url: 'javascript:;' },
          { title: '待审帖子', count: 77, url: 'javascript:;' },
          { title: '待审商品', count: 88, url: 'javascript:;' },
          { title: '待发货', count: 99, url: 'javascript:;' }
        ],
        [
          { title: '待审友情链接', count: 99, url: 'javascript:;' }
        ]
      ]
    };
  },

  methods: {
    selectIndicator(val) {
      this.$refs.todos.setActiveItem(val - 1);
    }
  }
};
</script>
<style lang="scss">
@import '~demo-css/demo-vars';

.u-todos {
  .l-todos--item {
    width: calc(50% - 10px);
    float: left;
    text-align: left;
    padding: 5px;

    a {
      display: block;
      color: $--color-font-light;
      padding: 10px 15px;
      background: $--color-background-light3;
      border-radius: 2px;
      transition: all 0.3s ease;

      &:hover {
        background: $--color-background-light;
        color: $--color-font-gray;
      }
    }
  }

  .l-item--title {
    font-size: 12px;
    font-weight: bold;
    line-height: 24px;
    padding-bottom: 10px;
  }

  .l-item--count {
    font-style: normal;
    font-size: 30px;
    font-weight: 300;
    line-height: 30px;
  }

  .page0 { color: #009688; }
  .page1 { color: #FF5722; }
}
</style>
