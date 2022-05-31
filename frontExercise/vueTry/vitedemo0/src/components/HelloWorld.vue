<script setup>
import { ref } from 'vue'

defineProps({
  msg: String
})

const count = ref(0)
</script>

<template>
  <h1>{{ msg }}</h1>

  <p>
    <!-- Recommended IDE setup:
    <a href="https://code.visualstudio.com/" target="_blank">VS Code</a>
    +
    <a href="https://github.com/johnsoncodehk/volar" target="_blank">Volar</a> -->
  </p>

  <p>
    <a href="https://vitejs.dev/guide/features.html" target="_blank">
      Vite Documentation
    </a>
    |
    <a href="https://v3.vuejs.org/" target="_blank">Vue 3 Documentation</a>
  </p>
  <button type="button" @click="count++">count is: {{ count }}</button>
  <p>  </p>
  <button type="button" @click="count++">count is: {{ count }}</button>

  <p>
  
    
  </p>

  <!-- 登录 -->
  <el-form-item prop="username">
    <el-input
      v-model="state.loginForm.username"
      placeholder="用户名"
      type="text"
      tabindex="1"
      :prefix-icon="User"
      size="large"
    />
  </el-form-item>
</template>

<style scoped>
a {
  color: #ba0520;
}
h1 {
  color: #002e5a;
}
</style>
