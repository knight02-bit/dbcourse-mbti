<template>
  <div class="app-container">
    <div>
      <el-input
        v-model="inputStr"
        stripe
        placeholder="右边选择查询方式:  学院 / 系别 / 班级 / 学号 / 名字"
        class="input-with-select"
      >
        <template #prepend>
          <el-button @click="find_student(inputStr)">🔍</el-button>
        </template>
        <template #append>
          <el-select v-model="selectKind" placeholder="选择" style="width: 200px">
            <el-option label="学院(如: 计算机科学与工程学院)" value="cg" />
            <el-option label="系别(如: 软件工程)" value="dep" />
            <el-option label="班级(系别+班级号, 如: 软件工程202)" value="depclass" />
            <el-option label="学号" value="id" />
            <el-option label="名字" value="name" />
          </el-select>
        </template>
      </el-input>
    </div>
    <el-table :data="studentInfoes" stripe style="width: 100%">
      <el-table-column prop="Sid" label="学号" sortable />
      <el-table-column prop="Sname" label="姓名" sortable />
      <el-table-column prop="CGname" label="学院" sortable />
      <el-table-column prop="Dname" label="系别" sortable />
      <el-table-column prop="Cid" label="班级" sortable />

      <el-table-column label="删除">
        <template #default="scope">
          <el-button size="large" type="danger" @click="handleDelete(scope.$index, scope.row)">Delete</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script setup lang="ts">
import { ref } from "vue"
import { StudentInfo } from "@/models"
import { request } from "@/utils/service"

const inputStr = ref("")
const selectKind = ref("id")

const studentInfoes = ref<StudentInfo[]>([])
const find_student = (inputStr) => {
  let findStr = ""
  if (selectKind.value == "cg") findStr += "/info-cg/" + inputStr
  else if (selectKind.value == "dep") findStr += "/info-dep/" + inputStr
  else if (selectKind.value == "depclass") {
    var numBegin = 0
    for (var i = 0; i < inputStr.length; i++) {
      if (inputStr[i] >= "0" && inputStr[i] <= "9") {
        numBegin = i
        break
      }
    }
    const dep = inputStr.substring(0, numBegin)
    const cid = inputStr.substring(numBegin, inputStr.length)
    findStr += "/info-depclass/" + dep + "/" + cid
  } else if (selectKind.value == "id") findStr += "/info-id/" + inputStr
  else if (selectKind.value == "name") findStr += "/info-name/" + inputStr
  request({
    url: findStr,
    method: "get"
  }).then((resp) => {
    studentInfoes.value = resp.data.studentInfoes
  })
}

const handleDelete = (index: number, row: StudentInfo) => {
  console.log(index, row)
}
</script>

<style>
.input-with-select .el-input-group__prepend {
  background-color: var(--el-fill-color-blank);
}
</style>
