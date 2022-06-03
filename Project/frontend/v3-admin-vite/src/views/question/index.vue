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

<template>
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
</script>
