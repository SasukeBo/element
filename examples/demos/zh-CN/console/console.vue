<template>
  <div class="u-console">
    <el-row :gutter="15">
      <el-col :span="8">
        <div class="l-con--card">
          <div class="l-card--title">快捷方式</div>
          <div class="l-card--body">
            <convenient></convenient>
          </div>
        </div>
      </el-col>
      <el-col :span="8">
        <div class="l-con--card">
          <div class="l-card--title">待办事项</div>
          <div class="l-card--body">
            <div style="height: 185px;"></div>
          </div>
        </div>
      </el-col>
      <el-col :span="8">
        <div class="l-con--card">
          <div class="l-card--title">版本信息</div>
          <div class="l-card--body">
            <div style="height: 185px;"></div>
          </div>
        </div>
      </el-col>
    </el-row>

    <el-row :gutter="15">
      <el-col :span="16">
        <div class="l-con--card">
          <div class="l-card--title">数据概览</div>
          <div class="l-card--body">
            <div style="height: 332px;"></div>
          </div>
        </div>
      </el-col>
      <el-col :span="8">
        <el-row>
          <div class="l-con--card">
            <div class="l-card--title">效果报告</div>
            <div class="l-card--body">
              <div style="height: 127px;"></div>
            </div>
          </div>
        </el-row>
        <el-row>
          <div class="l-con--card">
            <div class="l-card--title">效果报告</div>
            <div class="l-card--body">
              <div style="height: 127px;"></div>
            </div>
          </div>
        </el-row>
      </el-col>
    </el-row>

    <el-row :gutter="15">
      <el-col :span="16">
        <div class="l-con--card">
          <div class="l-card--title">今日热搜</div>
          <div class="l-card--body">
            <div style="height: 470px;"></div>
          </div>
        </div>
      </el-col>
      <el-col :span="8">
        <el-row>
          <div class="l-con--card">
            <div class="l-card--title">产品动态</div>
            <div class="l-card--body">
              <div style="height: 60px;"></div>
            </div>
          </div>
        </el-row>
        <el-row>
          <div class="l-con--card">
            <div class="l-card--title">作者心语</div>
            <div class="l-card--body">
              <div style="height: 272px;"></div>
            </div>
          </div>
        </el-row>
      </el-col>
    </el-row>
  </div>
</template>
<script>
import Convenient from './convenient';

export default {
  components: {
    Convenient
  }
};
</script>
<style lang="scss">
@import '~demo-css/demo-vars.scss';

.u-console {
  padding: 15px;
}

.l-con--card {
  background-color: $--color-white;
  border-radius: 2px;
  box-shadow: $--box-shadow-primary;
}

.l-card--title {
  height: 42px;
  line-height: 42px;
  padding: 0 15px;
  border-bottom: 1px solid $light2;
  color: $--color-font-black;
  font-size: 14px;
}

.l-card--body {
  padding: 10px 15px;
}

.el-row {
  margin-bottom: 15px;

  &:last-child {
    margin-bottom: 0;
  }
}
</style>
