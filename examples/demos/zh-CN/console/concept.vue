<template>
  <div class="l-con--card">
    <div class="l-card--title">
      设计原则
      <el-tooltip
        effect="dark"
        content="支持支持"
        placement="top"
        style="float: right; padding: 0 5px; line-height: 42px;"
      >
        <i class="el-icon-info"></i>
      </el-tooltip>
    </div>
    <div class="l-card--body">
      <div style="height: 272px;" class="u-concept">
        <div class="l-concept--tip">
          <span class="l-tip--title">一致性 Consistency</span>
          与现实生活一致、与界面中一致
        </div>

        <div class="l-concept--tip">
          <span class="l-tip--title">反馈 Feedback</span>
          控制反馈、页面反馈
        </div>

        <div class="l-concept--tip">
          <span class="l-tip--title">效率 Efficiency</span>
          简化流程、清晰明确、帮助用户识别
        </div>

        <div class="l-concept--tip">
          <span class="l-tip--title">可控 Controllability</span>
          用户决策、结果可控
        </div>
      </div>
    </div>
  </div>
</template>
<style lang="scss">
@import '~demo-css/demo-vars';

.u-concept {
  .l-concept--tip {
    font-size: 14px;
    padding: 5px 0;
    color: $--color-font-gray;
  }

  .l-tip--title {
    display: block;
    font-size: 20px;
    color: $--color-font-black;
    margin-bottom: 5px;
  }
}
</style>

