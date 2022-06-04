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
