<template>
  <div>
    <el-table
        :data="tableData"
        style="width: 100%"
        border
    >
      <el-table-column
        type="index"
        fixed
        width="40"
      ></el-table-column>

      <el-table-column
        label="关键词"
        prop="keyword"
        width="300">
        <template slot-scope="scope">
          <a :href="scope.row.url">{{ scope.row.keyword }}</a>
        </template>
      </el-table-column>

      <el-table-column
        label="搜索次数"
        prop="searchCount"
        width="207"
        sortable
      ></el-table-column>

      <el-table-column
        label="用户数"
        prop="userCount"
        width="207"
        sortable
      ></el-table-column>
    </el-table>
  </div>
</template>
<script>
export default {
  data() {
    return {
      tableData: [
        { keyword: '网站快速成型工具', url: 'http://element-cn.eleme.io', searchCount: 999, userCount: 123 },
        { keyword: '渐进式 JavaScript 框架', url: 'https://cn.vuejs.org/', searchCount: 999, userCount: 123 },
        { keyword: '一套构建跨平台开发方案', url: 'https://weex.apache.org/cn/', searchCount: 999, userCount: 123 }
      ]
    };
  }
};
</script>
