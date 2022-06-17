<template>
  <div class="app-container">
    <el-carousel
      :loop="false"
      trigger="click"
      ref="carouselRef"
      indicator-position="none"
      height="500px"
      :autoplay="false"
      class="test"
    >
      <el-carousel-item v-for="item in questions2.length" :key="item">
        <div>
          <center>
            <h2>{{ questions2[item]?.["Qid"] }}</h2>
            <h2>{{ questions2[item]?.["Qtext"] }}</h2>
          </center>
          <center>
            <el-button type="success" plain @click="choseA(questions2[item])">
              A.{{ questions2[item]?.["QAtext"] }}
            </el-button>
            <p />
            <p />
            <el-button type="primary" plain @click="choseB(questions2[item])">
              B.{{ questions2[item]?.["QBtext"] }}
            </el-button>
            <p />
            <el-button type="info" v-if="questions2[item]?.['Qid'] == questions.length" @click="show_character">
              查看测试结果
            </el-button>
          </center>
        </div>
      </el-carousel-item>
    </el-carousel>
  </div>
</template>

<script lang="ts" setup>
import { ElMessage, ElMessageBox } from "element-plus"
import { onBeforeMount, ref } from "vue"
import { request } from "@/utils/service"
import { Question, Character, ResultResp } from "@/models"
import { useUserStore } from "@/store/modules/user"
import { format } from "date-fns"

let isSave = false //记录学生的结果是否记录(不可重复记录)

const carouselRef = ref()
const role = useUserStore().roles
const questions = ref<Question[]>([])
const questions2 = ref<Question[]>([])
const characters = ref<Character[]>([])
let characMapping = new Map()

var isChoose: number[] = new Array(500)

const load_test = () => {
  ElMessage({
    message: "开始键在屏幕的右侧👉",
    type: "success"
  })
  //初始化标记数组
  for (var i = 0; i < isChoose.length; i++) {
    isChoose[i] = 0
  }
  request({
    url: "/question",
    method: "get"
  }).then((resp) => {
    questions.value = resp.data.questions
    questions2.value.push({
      Qid: 0,
      Qtext: "",
      QAtext: "",
      QBtext: "",
      QTid: 1,
      QAvalue: "",
      QBvalue: ""
    })
    for (var i = 0; i < questions.value.length; i++) {
      questions2.value.push(questions.value[i])
    }
    ElMessageBox.alert(
      "共" + questions.value.length + "道题目, 仅有一次答题机会, 若没有题目说明, 请选择你中意的选项 ",
      "▷ Tip :开始键在屏幕的右侧👉",
      {
        confirmButtonText: " ✔ "
      }
    )
  })

  request({
    url: "/character",
    method: "get"
  }).then((resp) => {
    characters.value = resp.data.characters
    for (var i = 0; i < characters.value.length; i++) {
      characMapping.set(characters.value[i].Ctype, "👉" + characters.value[i].Ctext)
      // console.log(characters.value[i]["Ctype"])
      // console.log(characMapping.get(characters.value[i].Ctype))
    }
  })
}
onBeforeMount(load_test)

let cntTotal = 0
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
const choseA = (item: Question) => {
  var now = item["Qid"]
  if (now > 1 && isChoose[now - 1] == 0) {
    alert("ԅ(¯﹃¯ԅ)上一题您还未作答")
  } else {
    if (isChoose[now] == 0) {
      isChoose[now] = 1
      cnt[item["QAvalue"]]++
      cntTotal++
    } else if (isChoose[now] == 1) {
      alert("💡您已选择过A, 不要紧张, 这只是小小的测试哦")
    } else {
      alert("💡您已选择过B, 不要紧张, 这只是小小的测试哦")
    }
    // 自动跳转
    if (cntTotal != questions.value.length) {
      carouselRef.value.next()
    }
  }
}
const choseB = (item: Question) => {
  var now = item["Qid"]
  if (now > 1 && isChoose[now - 1] == 0) {
    alert("ԅ(¯﹃¯ԅ)上一题您还未作答")
  } else {
    if (isChoose[now] == 0) {
      isChoose[now] = 2
      cnt[item["QBvalue"]]++
      cntTotal++
    } else if (isChoose[now] == 1) {
      alert("💡您已选择过A, 不要紧张, 这只是小小的测试哦")
    } else {
      alert("💡您已选择过B, 不要紧张, 这只是小小的测试哦")
    }
    // 自动跳转
    if (cntTotal != questions.value.length) {
      carouselRef.value.next()
    }
  }
}

const show_character = () => {
  if (cntTotal != questions.value.length) {
    ElMessage({
      message: "尚未完成所有题目",
      type: "info"
    })
  } else {
    let resString = ""
    resString += cnt["E"] > cnt["I"] ? "E" : "I"
    resString += cnt["S"] > cnt["N"] ? "S" : "N"
    resString += cnt["T"] > cnt["F"] ? "T" : "F"
    resString += cnt["J"] > cnt["P"] ? "J" : "P"
    ElMessageBox.alert(characMapping.get(resString), resString, {
      confirmButtonText: "OK",
      callback: () => {
        ElMessage({
          type: "success",
          message: `您已完成该次测试`
        })
      }
    })

    const result = ref<ResultResp[]>([])
    //如果是学生且此次结果未录入则登记成绩
    if (role[0] == "student") {
      if (isSave) {
        ElMessage({
          message: "此次结果已记录, 系统不会重复录入",
          type: "info"
        })
      } else {
        const userName = useUserStore().username
        const date = new Date()
        console.log(format(date, "yyyy-MM-dd HH:mm:ss"))
        result.value = [
          {
            Sid: userName,
            Sname: "",
            Rtime: format(date, "yyyy-MM-dd HH:mm:ss"),
            Ctype: resString
          }
        ]
        //console.log(result.value[0])
        request({
          url: "/result-add",
          method: "post",
          data: result.value[0]
        }).then((resp) => {
          if (resp.data["isSuccess"]) {
            isSave = true
            ElMessage({
              message: "结果已记录",
              type: "success"
            })
          } else {
            ElMessage.error("结果记录失败")
          }
        })
      }
    }
  }
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
.el-carousel__item:nth-child(2n) {
  background-color: #e4f0b0;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #b8edf9;
}
</style>
