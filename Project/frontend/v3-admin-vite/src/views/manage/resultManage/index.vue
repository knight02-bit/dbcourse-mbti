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
          <el-button @click="find_result(inputStr)">🔍</el-button>
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
    <el-table :data="resultResps" stripe style="width: 100%">
      <el-table-column prop="Sid" label="学号" sortable />
      <el-table-column prop="Sname" label="姓名" sortable />
      <el-table-column prop="Rtime" label="🕤测试时间" sortable />
      <el-table-column prop="Ctype" label="结果" sortable />

      <el-table-column label="删除">
        <template #default="scope">
          <el-button size="large" type="danger" @click="handleDelete(scope.$index, scope.row)">Delete</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script setup lang="ts">
import { useUserStore } from "@/store/modules/user"
import { ref, reactive, onBeforeMount } from "vue"
import { ResultResp } from "@/models"
import { request } from "@/utils/service"
import { ElMessage, ElMessageBox, ElDrawer } from "element-plus"

const inputStr = ref("")
const selectKind = ref("id")

const role = useUserStore().roles
const resultResps = ref<ResultResp[]>([])
const warnTip = () => {
  if (role[0] == "student") {
    ElMessageBox.alert("非管理员不可使用", "WARN", {
      confirmButtonText: " ✔ "
    })
  }
}
onBeforeMount(warnTip)

const find_result = (inputStr) => {
  if (role[0] == "student") {
    ElMessageBox.alert("非管理员不可使用", "WARN", {
      confirmButtonText: " ✔ "
    })
  } else {
    let findStr = ""
    if (selectKind.value == "cg") findStr += "/res-cg/" + inputStr
    else if (selectKind.value == "dep") findStr += "/res-dep/" + inputStr
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
      findStr += "/res-depclass/" + dep + "/" + cid
    } else if (selectKind.value == "id") findStr += "/res-id/" + inputStr
    else if (selectKind.value == "name") findStr += "/res-name/" + inputStr
    request({
      url: findStr,
      method: "get"
    }).then((resp) => {
      resultResps.value = resp.data.resultResps
      console.log(resultResps.value.length)
    })
  }
}

const handleDelete = (index: number, row: ResultResp) => {
  ElMessageBox.confirm("是否要删除" + row.Sname + "在" + row.Rtime + "的测试", "WARN", {
    confirmButtonText: "确定",
    cancelButtonText: "取消",
    type: "warning"
  })
    .then(() => {
      request({
        url: "/del-result",
        method: "delete",
        data: row
      })
      ElMessage({
        type: "success",
        message: "删除成功"
      })
    })
    .catch(() => {
      ElMessage({
        type: "info",
        message: "取消删除操作"
      })
    })
}
</script>

<style>
.input-with-select .el-input-group__prepend {
  background-color: var(--el-fill-color-blank);
}
</style>
