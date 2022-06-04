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
    name: "knight",
    date: "2022/6/2",
    resString: "ISTJ",
    describe: "点击此处查看该人格详情"
  },
  {
    id: "2020082229",
    name: "knight",
    date: "2022/6/5",
    resString: "ASDF",
    describe: "点击此处查看该人格详情"
  },
  {
    id: "2020082229",
    name: "knight",
    date: "2022/6/2",
    resString: "FGHJ",
    describe: "点击此处查看该人格详情"
  },
  {
    id: "2020082229",
    name: "knight",
    date: "2022/6/5",
    resString: "RYTU",
    describe: "点击此处查看该人格详情"
  }
]
</script> -->

<template>
  <el-table :data="tableData" style="width: 100%">
    <!-- <el-table-column type="expand">
      <template>
        <div>
          <p>State</p>
        </div>
      </template>
    </el-table-column> -->
    <el-table-column label="  👇👇👇">
      <el-button type="success" style="margin-left: 1px" @click="drawer = true"> 查看详情 </el-button>
    </el-table-column>
    <el-table-column prop="id" label="学号" />
    <el-table-column prop="name" label="姓名" />
    <el-table-column prop="date" label="时间" />
    <el-table-column prop="resString" label="测试结果" />
  </el-table>

  <el-drawer v-model="drawer" title="测试结果: ISTG" :with-header="true">
    <span>
      {{ tableData[0].about }}
    </span>
  </el-drawer>
</template>

<script lang="ts" setup>
import { map } from "lodash"
import { ref } from "vue"
const drawer = ref(false)
const tableData = [
  {
    id: "2020082229",
    name: "knight",
    date: "2022年6月2日 15:27:18",
    resString: "ISTG",
    about: "balabala"
  }
]

const character = {
  ISTG: "ISTGISTGISTGISTGISTG",
  abcd: "abcdabcdabcdabcdabcd"
}
// map mp["ISTG"] = "HHHHHHH"
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
