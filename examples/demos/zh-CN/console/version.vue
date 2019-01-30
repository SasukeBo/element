<template>
  <div class="l-con--card">
    <div class="l-card--title">版本信息</div>
    <div class="l-card--body">
      <el-table
        :data="tableData"
        class="u-version"
        border
        style="height: 185px;"
        :show-header="false"
      >
        <el-table-column
          prop="name"
          width="100"
        ></el-table-column>
        <el-table-column
          prop="value"
          width="255"
        >
          <template slot-scope="scope">
            <div v-if="scope.row.value">{{ scope.row.value }}</div>
            <div v-else-if="scope.row.buttons">
              <el-button
                v-for="(button, index) in scope.row.buttons"
                :key="'button' + index"
                @click="button.method"
                :type="button.type"
              >{{ button.label }}</el-button>
            </div>
          </template>
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      tableData: [
        { name: '当前版本', value: 'v2.4.11' },
        { name: '基于框架', value: 'element-ui' },
        { name: '主要特色', value: '一致/反馈/效率/可控' },
        { name: '获取渠道', buttons: [
          { label: 'GitHub', type: 'danger', method: () => window.location.replace('https://github.com/elemefe') },
          { label: 'Element', type: 'primary', method: () => window.location.replace('https://element.eleme.io/') }
        ]}
      ]
    };
  },

  methods: {
    look(scope) {
      console.log(scope);
    }
  }
};
</script>
<style lang="scss">
.u-version td {
  padding: 9px 0;
}
</style>
