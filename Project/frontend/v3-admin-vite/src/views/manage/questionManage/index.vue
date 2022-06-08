<template>
  <div class="app-container">
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
import { StudentInfo, Question } from "@/models"
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
