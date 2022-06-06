<template>
  <el-table :data="tableData" style="width: 100%">
    <el-table-column label="  👇👇👇">
      <el-button type="success" style="margin-left: 1px" @click="drawer = true"> 查看详情 </el-button>
    </el-table-column>
    <el-table-column prop="id" label="学号" />
    <el-table-column prop="name" label="姓名" />
    <el-table-column prop="date" label="时间" />
    <el-table-column prop="resString" label="测试结果" />
  </el-table>

  <el-drawer :data="characMapping" v-model="drawer" title="测试结果" :with-header="true">
    <span>
      {{ characMapping.get("ESFJ") }}
    </span>
  </el-drawer>
</template>

<script lang="ts" setup>
import { map } from "lodash"
import { ref, onBeforeMount } from "vue"
import { request } from "@/utils/service"
// import { isToday, format } from "date-fns"

// const date = new Date()
// console.log(format(date, "YYYY-MM-DD"))
type Character = {
  Ctype: string
  Ctext: string
  Time: Date
}
const characters = ref<Character[]>([])
let characMapping = new Map()

request({
  url: "/character",
  method: "get"
}).then((resp) => {
  characters.value = resp.data.characters
  console.log("charNum", characters.value.length)

  for (var i = 0; i < characters.value.length; i++) {
    characMapping.set(characters.value[i].Ctype, characters.value[i].Ctype + "\n" + characters.value[i].Ctext)
    // console.log(characters.value[i]["Ctype"])
    console.log(characMapping.get(characters.value[i].Ctype))
  }
})

const drawer = ref(false)
const tableData = [
  {
    id: "2020082229",
    name: "knight",
    date: "2022年6月2日 15:27:18",
    resString: "ISTG"
  }
]

// const character = {
//   ISTG: "ISTGISTGISTGISTGISTG",
//   abcd: "abcdabcdabcdabcdabcd"
// }
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
