<template>
  <div class="app-container">
    <div>
      <el-input v-model="inputStr" placeholder="查询:  学院 / 系别 / 学号 / 名字" class="input-with-select">
        <template #prepend>
          <el-button @click="get_classRes(inputClassStr)">🔍</el-button>
        </template>
        <template #append>
          <el-select v-model="selectKind" placeholder="选择" style="width: 200px">
            <el-option label="学院(学院名,如计算机科学与工程)" value="1" />
            <el-option label="系别(系别全称, 如软件工程)" value="2" />
            <el-option label="学号" value="3" />
            <el-option label="名字" value="4" />
          </el-select>
        </template>
      </el-input>
    </div>
    <el-table :data="classResps" stripe style="width: 100%">
      <el-table-column prop="Sid" label="学号" sortable />
      <el-table-column prop="Sname" label="姓名" sortable />
      <el-table-column prop="Rtime" label="学院" sortable />
      <el-table-column prop="Rtime" label="系别" sortable />
      <el-table-column prop="Rtime" label="班级" sortable />

      <el-table-column prop="Ctype" label=" ">
        <!-- <el-button >{{ Ctype }}</el-button> -->
        <template v-slot="scope">
          <el-button @click="show_description(scope.row.Ctype)">{{ scope.row.Ctype }}</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script setup lang="ts">
import { ref } from "vue"
import { Search } from "@element-plus/icons-vue"
import { StudentInfo } from "@/models"

const input1 = ref("")
const input2 = ref("")
const input3 = ref("")
const select = ref("")
const inputStr = ref("")
const selectKind = ref("3")

const studentInfoes = ref<StudentInfo[]>([])
</script>

<style>
.input-with-select .el-input-group__prepend {
  background-color: var(--el-fill-color-blank);
}
</style>
