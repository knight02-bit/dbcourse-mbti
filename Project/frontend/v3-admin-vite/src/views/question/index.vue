<template>
  <el-button type="primary" plain disabled style="width: 100%">
    注: 共93道题目, 仅有一次答题机会, 若没有题目说明, 请选择你中意的选项↘开始
  </el-button>
  <el-carousel :loop="false" trigger="click" indicator-position="none" height="300px" :autoplay="false" class="test">
    <el-carousel-item v-for="item in questions" :key="item">
      <div>
        <center>
          <h2>{{ item["Qid"] }}</h2>
          <h2>{{ item["Qtext"] }}</h2>
        </center>
        <center>
          <el-button type="success" plain @click.once="choseA(item)">
            {{ item["QAtext"] }}
          </el-button>
          <p />
          <p />
          <el-button type="primary" plain @click.once="choseB(item)">
            {{ item["QBtext"] }}
          </el-button>
          <p />
          <p />
          <el-button type="info" v-if="item['Qid'] == 93" @click="load_characters"> 查看测试结果 </el-button>
        </center>
      </div>
    </el-carousel-item>
  </el-carousel>
  <el-drawer :data="characMapping" v-model="drawer" title="测试结果" :with-header="true">
    <span>
      {{ characMapping.get("ENFJ") }}
    </span>
  </el-drawer>
</template>

<script lang="ts" setup>
import { onBeforeMount, ref } from "vue"
import { request } from "@/utils/service"

// goWheel() {
//   this.$refs.swiper.prev();
// }

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
const load_questions = () => {
  request({
    url: "/question",
    method: "get"
  }).then((resp) => {
    questions.value = resp.data.questions
    // console.log("www", questions.value.length)
  })
}
onBeforeMount(load_questions)

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
  cnt[item["QAvalue"]]++
  this.$refs.color = "red"
  console.log("cnt", item["QAvalue"], "=", cnt[item["QAvalue"]])
}
const choseB = (item) => {
  cnt[item["QBvalue"]]++
  console.log("cnt", item["QBvalue"], "=", cnt[item["QBvalue"]])
}

//加载性格描述
type Character = {
  Ctype: string
  Ctext: string
}
const characters = ref<Character[]>([])
let characMapping = new Map()

let resString = ""
function testCheck() {
  if (cnt["E"] > cnt["I"]) resString += "E"
  else resString += "I"

  if (cnt["S"] > cnt["N"]) resString += "S"
  else resString += "N"

  if (cnt["T"] > cnt["F"]) resString += "T"
  else resString += "F"

  if (cnt["J"] > cnt["P"]) resString += "J"
  else resString += "P"
}

const load_characters = () => {
  testCheck()
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
    console.log(characMapping.get(resString))
  })
}
</script>

<style scoped>
.el-carousel__item h3 {
  color: #475669;
  opacity: 0.75;
  line-height: 200px;
  margin: 0;
  text-align: center;
}

.el-carousel__item:nth-child(2n) {
  background-color: #e4f0b0;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #b8edf9;
}
</style>
