<template>
  <div class="u-console">
    <el-row :gutter="15">
      <el-col :span="8">
        <convenient></convenient>
      </el-col>
      <el-col :span="8">
        <todos></todos>
      </el-col>
      <el-col :span="8">
        <version></version>
      </el-col>
    </el-row>

    <el-row :gutter="15">
      <el-col :span="16">
        <data-overview></data-overview>
      </el-col>
      <el-col :span="8">
        <el-row>
          <effect title="效果报告" :progresses="effectProgresses">
            <template slot="progressText__1">
              转化率（日同比28%
              <el-tooltip effect="dark" content="增长" placement="top">
                <i class="el-icon-caret-top"></i>
              </el-tooltip>
              ）
            </template>

            <template slot="progressText__2">
              签到率（日同比11%
              <el-tooltip effect="dark" content="下降" placement="top">
                <i class="el-icon-caret-bottom"></i>
              </el-tooltip>
              ）
            </template>
          </effect>
        </el-row>
        <el-row>
          <effect title="实时监控" :progresses="monitoringProgresses"></effect>
        </el-row>
      </el-col>
    </el-row>

    <el-row :gutter="15">
      <el-col :span="16">
        <hot-topics></hot-topics>
      </el-col>
      <el-col :span="8">
        <el-row>
          <dong-tai></dong-tai>
        </el-row>
        <el-row>
          <concept></concept>
        </el-row>
      </el-col>
    </el-row>
  </div>
</template>
<script>
import Convenient from './convenient';
import Todos from './todos';
import Version from './version';
import Effect from './effect';
import DataOverview from './data-overview';
import HotTopics from './hot-topics';
import DongTai from './dongtai';
import Concept from './concept';

export default {
  components: {
    Convenient,
    Todos,
    Version,
    DataOverview,
    Effect,
    HotTopics,
    DongTai,
    Concept
  },

  data() {
    return {
      effectProgresses: [
        { percentage: 65, text: '', color: '#5FB878' },
        { percentage: 32, text: '', color: '#5FB878' }
      ],

      monitoringProgresses: [
        { percentage: 58, text: 'CPU使用率', color: '#5FB878' },
        { percentage: 90, text: '内存占用率', color: '#FF5722' }
      ]
    };
  },

  methods: {
  }
};
</script>
<style lang="scss">
@import '~demo-css/demo-vars';

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

  .l-title--indicators {
    float: right;
    height: 100%;
    align-items: center;
    display: flex;
    padding: 0 5px;

    .indicator {
      width: 10px;
      height: 10px;
      cursor: pointer;
      background: $--color-background-light2;
      border-radius: 50%;
      margin: 0 3px;
      transition: background 0.3s ease;

      &.selected {
        background: $--color-background-dark2;
      }
    }
  }
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
