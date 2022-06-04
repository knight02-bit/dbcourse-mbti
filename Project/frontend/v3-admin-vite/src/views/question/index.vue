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
  <el-table :data="tableData" style="width: 100%" height="250">
    <el-table-column prop="questionId" label="题号" />
    <el-table-column prop="question" label="题目" />
    <el-table-column prop="aDescribe" label="A选项" />
    <el-table-column prop="bDescribe" label="B选项" />
    <el-table-column prop="selection" label="选择" />
  </el-table>
  <!-- <el-form-item>
    <el-button type="primary" @click="onSubmitCollege">QueryCollege</el-button>
  </el-form-item> -->
  <el-form-item>
    <el-button type="primary" @click="onSubmitQuestion">QueryQuestion</el-button>
  </el-form-item>
</template>

<script lang="ts" setup>
import { computed, ref } from "vue"
import { request } from "@/utils/service"
import { template } from "lodash"

type Question = {
  questionId: number
  question: string
  aDescribe: string
  bDescribe: string
  kind: number
}
const questions = ref<Question[]>([])
console.log(typeof questions.value[target])
const tableData = []

request({
  url: "/question",
  method: "get"
}).then((resp) => {
  questions.value = resp.data.questions
})
console.log("tableData", tableData)
console.log("questions", questions)

// const onSubmitQuestion = () => {
//   request({
//     url: "/question",
//     method: "get"
//   }).then((resp) => {
//     questions.value = resp.data.questions
//   })
//   //console.log(questions)
// }

// const tableData = [
//   {
//     questionId: 1,
//     question: "当你要外出一整天，你会",
//     aDescribe: "计划你要做什么和在什么时候做",
//     bDescribe: "说去就去"
//   },
//   {
//     questionId: 2,
//     question: "htyuytu",
//     aDescribe: "aaaaaaaaa",
//     bDescribe: "bbbbbbbbb"
//   },
//   {
//     questionId: 3,
//     question: "vbcnmcvbn",
//     aDescribe: "aaaaaaaaa",
//     bDescribe: "bbbbbbbbb"
//   }
// ]
</script>
