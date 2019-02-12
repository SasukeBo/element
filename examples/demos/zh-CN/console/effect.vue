<template>
  <div class="l-con--card">
    <div class="l-card--title">{{ title }}</div>
    <div class="l-card--body" style="padding-top: 5px;">
      <div class="u-effect">
        <div class="l-effect--progress progress__1">
          <div class="l-progress--text">
            <span class="percentage">{{ progresses[0].percentage }}%</span>
            <span class="text">
              <slot name="progressText__1">{{ progresses[0].text }}</slot>
            </span>
          </div>
          <el-progress
            :percentage="progresses[0].percentage"
            stroken-width="6"
            :show-text="false"
            :color="progresses[0].color"
          ></el-progress>
        </div>

        <div class="l-effect--progress progress__2">
          <div class="l-progress--text">
            <span class="percentage">{{ progresses[1].percentage }}%</span>
            <span class="text">
              <slot name="progressText__2">{{ progresses[1].text }}</slot>
            </span>
          </div>
          <el-progress
            :percentage="progresses[1].percentage"
            stroken-width="6"
            :show-text="false"
            :color="progresses[1].color"
          ></el-progress>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  props: {
    title: String,
    progresses: Array
  },

  data() {
    return {
    };
  }
};
</script>
<style lang="scss">
@import '~demo-css/demo-vars.scss';

.u-effect {
  position: relative;

  .l-effect--progress {
    position: relative;
  }

  .progress__1 {
    margin: 50px 0 60px;
  }

  .progress__2 {
    margin: 50px 0 10px;
  }

  .l-progress--text {
    position: absolute;
    top: -35px;
    left: 0;
    right: 0;

    .percentage {
      line-height: 26px;
      font-size: 26px;
      color: $--color-font-gray;
    }

    .text {
      float: right;
      color: $--color-font-light;
      font-size: 14px;
    }

    i {
      font-size: 16px;
    }
  }
}
</style>
