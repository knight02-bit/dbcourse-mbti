<template>
  <el-card class="box-card" v-for="item in characters" :key="item" :width="100%">
    <template #header>
      <div class="card-header">
        <span>{{ item["Ctype"] }}</span>
        <span />
      </div>
    </template>
    <div>{{ item["Ctext"] }}</div>
  </el-card>
</template>

<style>
.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.text {
  font-size: 14px;
}

.item {
  margin-bottom: 18px;
}

.box-card {
  width: 480px;
}
</style>

<script lang="ts" setup>
import { onBeforeMount, ref, getCurrentInstance } from "vue"
import { request } from "@/utils/service"
import { Question, Character } from "@/models"

const characters = ref<Character[]>([])
const load_test = () => {
  request({
    url: "/character",
    method: "get"
  }).then((resp) => {
    characters.value = resp.data.characters
    console.log("charNum", characters.value.length)
  })
}
onBeforeMount(load_test)
</script>
