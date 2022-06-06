<template>
  <el-button type="primary" plain disabled style="width: 100%">
    注: 共93道题目, 仅有一次答题机会, 若没有题目说明, 请选择你中意的选项
  </el-button>
  <el-carousel :loop="false" trigger="click" indicator-position="none" height="500px" :autoplay="false" class="test">
    <el-carousel-item v-for="item in questions" :key="item">
      <div>
        <center>
          <h2>{{ item["Qid"] }}</h2>
          <h2>{{ item["Qtext"] }}</h2>
        </center>
        <center>
          <el-button type="success" plain @click="choseA(item)"> A.{{ item["QAtext"] }} </el-button>
          <p />
          <p />
          <el-button type="primary" plain @click="choseB(item)"> B.{{ item["QBtext"] }} </el-button>
          <p />

          <el-button type="info" v-if="item['Qid'] == questions.length" @click="show_character">
            查看测试结果
          </el-button>
        </center>
      </div>
    </el-carousel-item>
  </el-carousel>
  <!-- <el-drawer :data="characMapping" v-model="drawer" title="测试结果" :with-header="true">
    <span>
      {{ characMapping.get("ENFJ") }}
    </span>
  </el-drawer> -->
</template>

<script lang="ts" setup>
import { onBeforeMount, ref } from "vue"
import { request } from "@/utils/service"

//加载问题
type Question = {
  Qid: number
  Qtext: string
  QAtext: string
  QBtext: string
  QTid: number
  QAvalue: string
  QBvalue: string
  choice: string
}
const questions = ref<Question[]>([])

//加载性格描述
type Character = {
  Ctype: string
  Ctext: string
}
const characters = ref<Character[]>([])
let characMapping = new Map()

var isChoose: number[] = new Array(200)

const load_test = () => {
  //初始化标记数组
  for (var i = 0; i < isChoose.length; i++) {
    isChoose[i] = 0
    console.log(isChoose[i])
  }
  request({
    url: "/question",
    method: "get"
  }).then((resp) => {
    questions.value = resp.data.questions
    // console.log("www", questions.value.length)
  })
  request({
    url: "/character",
    method: "get"
  }).then((resp) => {
    characters.value = resp.data.characters
    console.log("charNum", characters.value.length)

    for (var i = 0; i < characters.value.length; i++) {
      characMapping.set(characters.value[i].Ctype, characters.value[i].Ctype + "\n" + characters.value[i].Ctext)
      // console.log(characters.value[i]["Ctype"])
      // console.log(characMapping.get(characters.value[i].Ctype))
    }
  })
}
onBeforeMount(load_test)

const cnt = {
  E: 0,
  I: 0,
  S: 0,
  N: 0,
  T: 0,
  F: 0,
  J: 0,
  P: 0
}
const choseA = (item) => {
  var now = item["Qid"]
  if (now > 1 && isChoose[now - 1] == 0) {
    alert("ԅ(¯﹃¯ԅ)上一题您还未作答")
  } else {
    if (isChoose[now] == 0) {
      isChoose[now] = 1
      cnt[item["QAvalue"]]++
      console.log("cnt", item["QAvalue"], "=", cnt[item["QAvalue"]])
    } else if (isChoose[now] == 1) {
      alert("💡您已选择过A, 不要紧张, 这只是小小的测试哦")
    } else {
      alert("💡您已选择过B, 不要紧张, 这只是小小的测试哦")
    }
  }
}
const choseB = (item) => {
  var now = item["Qid"]
  if (now > 1 && isChoose[now - 1] == 0) {
    alert("ԅ(¯﹃¯ԅ)上一题您还未作答")
  } else {
    if (isChoose[now] == 0) {
      isChoose[now] = 1
      cnt[item["QBvalue"]]++
      console.log("cnt", item["QBvalue"], "=", cnt[item["QBvalue"]])
    } else if (isChoose[now] == 1) {
      alert("💡您已选择过A, 不要紧张, 这只是小小的测试哦")
    } else {
      alert("💡您已选择过B, 不要紧张, 这只是小小的测试哦")
    }
  }
}

// const drawer = ref(false)
const show_character = () => {
  let resString = ""
  resString += cnt["E"] > cnt["I"] ? "E" : "I"
  resString += cnt["S"] > cnt["N"] ? "S" : "N"
  resString += cnt["T"] > cnt["F"] ? "T" : "F"
  resString += cnt["J"] > cnt["P"] ? "J" : "P"
  console.log(characMapping.get(resString))
}
</script>

<style scoped>
.el-carousel__item h3 {
  color: #475669;
  opacity: 0.75;
  line-height: 300px;
  margin: 0;
  text-align: center;
}

/* .el-carousel__item:nth-child(2n) {
  background-color: #e4f0b0;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #b8edf9;
} */

.el-carousel__item:nth-child(2n) {
  background-color: #e4f0b0;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #b8edf9;
}
</style>
