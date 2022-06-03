<!-- <template>
  <div h-full app-container>
    <div h-full text-center flex select-none all:transition-400>
      <div ma>
        <div text-5xl fw100 animate-bounce-alt animate-count-infinite animate-1s>unocss</div>
        <div op30 dark:op60 text-lg fw300 m1>具有高性能且极具灵活性的即时原子化 CSS 引擎</div>
        <div m2 flex justify-center text-lg op30 dark:op60 hover="op80" dark:hover="op80">
          <a href="https://antfu.me/posts/reimagine-atomic-css-zh" target="_blank">推荐阅读：重新构想原子化 CSS</a>
        </div>
      </div>
    </div>
    <div absolute bottom-5 right-0 left-0 text-center op30 dark:op60 fw300>
      该页面是一个 unocss 的使用案例，其他页面依旧采用 sass
    </div>
  </div>
</template> -->

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
  <el-form :inline="true" :model="formInline" class="demo-form-inline">
    <el-form-item label="学号">
      <el-input v-model="formInline.user" placeholder="请输入学号(10位)" />
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="onSubmit">Query</el-button>
    </el-form-item>
  </el-form>
</template>

<script lang="ts" setup>
import { reactive } from "vue"

const formInline = reactive({
  user: "",
  region: ""
})

const onSubmit = () => {
  console.log("submit!")
}
</script>
