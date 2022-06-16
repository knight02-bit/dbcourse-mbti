<template>
  <div class="app-container">
    <div>
      <el-input v-model="inputSid" placeholder="请输入学号" class="input-with-select">
        <template #prepend>
          <el-button @click="get_studentRes(inputSid)">🔍</el-button>
        </template>
      </el-input>
    </div>

    <el-table :data="resultResps" stripe style="width: 100%">
      <el-table-column prop="Sid" label="🔢学号" />
      <el-table-column prop="Sname" label="🖍姓名" />
      <el-table-column prop="Rtime" label="🕤时间" sortable />
      <el-table-column prop="Ctype" label="📜测试结果(点击查看详情👇)">
        <!-- <el-button >{{ Ctype }}</el-button> -->
        <template v-slot="scope">
          <el-button @click="show_description(scope.row.Ctype)">{{ scope.row.Ctype }}</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script lang="ts" setup>
import { ElMessage, ElMessageBox } from "element-plus"
import type { Action } from "element-plus"
import { map } from "lodash"
import { ref, onBeforeMount, onMounted } from "vue"
import { request } from "@/utils/service"
import { Character, ResultResp } from "@/models"

const inputSid = ref("")
const characters = ref<Character[]>([])
let characMapping = new Map()

const Init = () => {
  ElMessage({
    message: "若无显示,请进行刷新",
    type: "success"
  })
  request({
    url: "/character",
    method: "get"
  }).then((resp) => {
    characters.value = resp.data.characters
    //console.log("charNum", characters.value.length)

    for (var i = 0; i < characters.value.length; i++) {
      characMapping.set(characters.value[i].Ctype, "💬" + characters.value[i].Ctext)
      // console.log(characters.value[i]["Ctype"])
      // console.log(characMapping.get(characters.value[i].Ctype))
    }
  })
}
onMounted(Init)

const resultResps = ref<ResultResp[]>([])
const get_studentRes = (input: string) => {
  request({
    url: "/student-res/" + input,
    method: "get"
  }).then((resp) => {
    resultResps.value = resp.data.resultResps
    // console.log("resultResps :", resultResps)
  })
}

const show_description = (res: string) => {
  ElMessageBox.alert(characMapping.get(res), "🚩" + res, {
    confirmButtonText: "OK",
    callback: () => {
      ElMessage({
        type: "success",
        message: `☆ ` + res + ` ☆ `
      })
    }
  })
}
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

.input-with-select .el-input-group__prepend {
  background-color: var(--el-fill-color-blank);
}
</style>
