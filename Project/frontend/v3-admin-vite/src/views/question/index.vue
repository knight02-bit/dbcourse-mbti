<!-- <template>
  <div>
    <el-radio-group v-model="radio1">
      <el-radio label="1" size="large" border>Option A</el-radio>
      <el-radio label="2" size="large" border>Option B</el-radio>
    </el-radio-group>
  </div>
</template>

<script lang="ts" setup>
import { ref } from "vue"

const radio1 = ref("1")
</script> -->

<!-- ccccccccccccccccccccccQueryccccccccccccccccccc -->
<!-- <template>
  <el-form-item>
    <el-button type="primary" @click="onSubmit">Query</el-button>
  </el-form-item>
</template>

<script lang="ts" setup>
import { request } from "@/utils/service"
import { ref } from "vue"

type College = {
  name: string
}

const colleges = ref<College[]>([])

const onSubmit = () => {
  console.log("submit!")
  request({
    url: "/college",
    method: "get"
  }).then((resp) => {
    colleges.value = resp.data.colleges
  })
  //console.log(colleges)
}
</script> -->

<!-- <template>
  <el-table :data="filterTableData" style="width: 100%">
    <el-table-column label="题号" prop="questionId" />
    <el-table-column label="问题" prop="question" />
    <el-table-column label="A" prop="aDescribe" />
    <el-table-column label="B" prop="bDescribe" />
    <el-table-column align="right">
      <template #header>
        <el-input v-model="search" size="small" placeholder="💡search question" />
      </template>
      <template #default="scope">
        <div>
          <el-radio-group v-model="radio1">
            <el-radio label="1" size="large" border>A</el-radio>
            <el-radio label="2" size="large" border>B</el-radio>
          </el-radio-group>
        </div>
      </template>
    </el-table-column>
  </el-table>
  <el-form-item>
    <el-button type="primary" @click="onSubmitCollege">QueryCollege</el-button>
  </el-form-item>
  <el-form-item>
    <el-button type="primary" @click="onSubmitQuestion">QueryQuestion</el-button>
  </el-form-item>
</template> -->

<template>
  <el-button plain @click="open2"> Warning </el-button>
  <el-button type="primary" plain disabled style="width: 100%">注: 若没有题目说明, 请选择你中意的形容</el-button>
  <el-table :data="questions" style="width: 100%">
    <el-table-column prop="Qid" label="题号" width="70%" />
    <el-table-column prop="Qtext" label="题目" />
    <el-table-column prop="QAtext" label="A选项" />
    <el-table-column prop="QBtext" label="B选项" />
    <el-table-column prop="SelectRes" label="A👈 - - - -  👉B">
      <el-tooltip :content="'选择: ' + value" placement="right">
        <el-switch
          v-model="value"
          active-color="#79bbff"
          inactive-color="#95d475"
          active-value="B"
          inactive-value="A"
          width="100px"
        />
      </el-tooltip>
    </el-table-column>
  </el-table>
</template>

<script lang="ts" setup>
import { computed, ref } from "vue"
import { request } from "@/utils/service"
// import { template } from "lodash"
import { ElNotification } from "element-plus"

type Question = {
  Qid: number
  Qtext: string
  QAtext: string
  QBtext: string
  QTid: number
  SelectRes: string
}
const questions = ref<Question[]>([])

const value = ref("1")
request({
  url: "/question",
  method: "get"
}).then((resp) => {
  questions.value = resp.data.questions
})
const open2 = () => {
  ElNotification({
    title: "Warning",
    message: "This is a warning message",
    type: "warning"
  })
}
</script>
