<!-- <template>
  <div class="app-container">
    <center><el-card> 我的测试记录 </el-card></center>
  </div>
  <el-table :data="tableData" height="500" style="width: 100%">
    <el-table-column prop="id" label="学号" />
    <el-table-column prop="name" label="姓名" />
    <el-table-column prop="date" label="时间" />
    <el-table-column prop="resString" label="测试结果" />
    <el-table-column prop="describe" label="对应人格" />
  </el-table>
</template>

<script lang="ts" setup>
const tableData = [
  {
    id: "2020082229",
    name: "佟帅杰",
    date: "2022/6/2",
    resString: "ISTJ",
    describe: "点击此处查看该人格详情"
  },
  {
    id: "2020082229",
    name: "佟帅杰",
    date: "2022/6/5",
    resString: "ASDF",
    describe: "点击此处查看该人格详情"
  },
  {
    id: "2020082229",
    name: "佟帅杰",
    date: "2022/6/2",
    resString: "FGHJ",
    describe: "点击此处查看该人格详情"
  },
  {
    id: "2020082229",
    name: "佟帅杰",
    date: "2022/6/5",
    resString: "RYTU",
    describe: "点击此处查看该人格详情"
  }
]
</script> -->

<template>
  <el-table :data="tableData" style="width: 100%">
    <el-table-column type="expand">
      <template>
        <div>das</div>
      </template>
    </el-table-column>
    <el-table-column prop="id" label="学号" />
    <el-table-column prop="name" label="姓名" />
    <el-table-column prop="date" label="时间" />
    <el-table-column prop="resString" label="测试结果" />
  </el-table>
  <div class="demo-image__preview">
    <el-image
      style="width: 100px; height: 100px"
      src="https://img-blog.csdnimg.cn/87f9ca33969b4878bd00e2476fec6780.png"
      fit="fill"
    />
  </div>
</template>

<script lang="ts" setup>
const tableData = [
  {
    id: "2020082229",
    name: "佟帅杰",
    date: "2022年6月2日 15:27:18",
    resString: "ASDF"
  }
]
</script>

<style scoped>
.demo-image__error .image-slot {
  font-size: 30px;
}
.demo-image__error .image-slot .el-icon {
  font-size: 30px;
}
.demo-image__error .el-image {
  width: 100%;
  height: 200px;
}
</style>
