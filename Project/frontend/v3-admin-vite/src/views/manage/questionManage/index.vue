<template>
  <div class="app-container">
    <center><el-button>注意: MBTI用来测试性格是有依据的, 建议不要轻易增删</el-button></center>
    <el-table :data="questions" stripe style="width: 100%">
      <el-table-column prop="Qid" label="题标(唯一)" />
      <el-table-column prop="Qtext" label="题目" />
      <el-table-column prop="QAtext" label="A选项" />
      <el-table-column prop="QAvalue" label="特征权值" />
      <el-table-column prop="QBtext" label="A选项" />
      <el-table-column prop="QBvalue" label="特征权值" />
      <el-table-column label="删除">
        <template #default="scope">
          <el-button size="large" type="danger" @click="handleDelete(scope.$index, scope.row)">Delete</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script setup lang="ts">
import { ref, onBeforeMount } from "vue"
import { Question } from "@/models"
import { request } from "@/utils/service"
import { ElMessage, ElMessageBox, ElDrawer } from "element-plus"
import { useUserStore } from "@/store/modules/user"

const role = useUserStore().roles
const questions = ref<Question[]>([])
const find_question = () => {
  if (role[0] == "student") {
    ElMessageBox.alert("非管理员不可使用", "WARN", {
      confirmButtonText: " ✔ "
    })
  } else {
    request({
      url: "/question",
      method: "get"
    }).then((resp) => {
      questions.value = resp.data.questions
    })
  }
}
onBeforeMount(find_question)

const handleDelete = (index: number, row: StudentInfo) => {
  console.log(index, row)
}
</script>

<style>
.input-with-select .el-input-group__prepend {
  background-color: var(--el-fill-color-blank);
}
</style>
