<template>
  <div class="l-con--card">
    <div class="l-card--title">快捷方式
      <indicators :count="2" @selected="selectIndicator"></indicators>
    </div>

    <div class="l-card--body">
      <el-carousel
        class="u-convenient"
        height="185px"
        :autoplay="false"
        arrow="never"
        indicator-position="none"
        ref="convenient"
      >
        <el-carousel-item v-for="(item, index) in items" :key="'item' + index">
          <div v-for="(row, index) in item" :key="'row' + index" class="l-convenient--row">
            <div v-for="(col, index) in row" :key="'col' + index" class="l-convenient--col">
              <i :class="'el-icon-' + col.icon"/>
              <span>{{ col.span }}</span>
            </div>
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
      items: [
        [
          [
            { icon: 'phone', span: '快捷一' },
            { icon: 'bell', span: '快捷二' },
            { icon: 'mobile-phone', span: '快捷三' },
            { icon: 'service', span: '快捷四' }
          ],
          [
            { icon: 'menu', span: '快捷五' },
            { icon: 'picture', span: '快捷六' },
            { icon: 'upload', span: '快捷七' },
            { icon: 'delete', span: '快捷八' }
          ]
        ],
        [
          [
            { icon: 'picture', span: '快捷1' },
            { icon: 'delete', span: '快捷2' },
            { icon: 'upload', span: '快捷3' },
            { icon: 'menu', span: '快捷4' }
          ],
          [
            { icon: 'bell', span: '快捷5' },
            { icon: 'phone', span: '快捷6' },
            { icon: 'service', span: '快捷7' },
            { icon: 'mobile-phone', span: '快捷8' }
          ]
        ]
      ]
    };
  },

  methods: {
    selectIndicator(val) {
      this.$refs.convenient.setActiveItem(val - 1);
    }
  }
};
</script>
<style lang="scss">
@import '~demo-css/demo-vars';
.u-convenient {
  text-align: center;

  .l-convenient--row {
    display: flex;
  }

  .l-convenient--col {
    padding: 5px;
    font-size: 14px;
  }

  .l-convenient--col i {
    display: block;
    width: 79.16px;
    height: 60px;
    line-height: 60px;
    color: $--color-font-black;
    background: $--color-background-light3;
    font-size: 30px;
  }

  .l-convenient--col span {
    display: block;
    height: 24px;
    line-height: 24px;
  }
}
</style>
