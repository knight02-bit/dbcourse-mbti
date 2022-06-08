<template>
  <div>
    <el-input
      v-model="inputClassStr"
      placeholder="请输入班级(专业全名+班级号, 如软件工程202)"
      class="input-with-select"
    >
      <template #prepend>
        <el-button @click="get_classRes(inputClassStr)">🔍</el-button>
      </template>
    </el-input>
  </div>
  <center><el-button>软件工程202班</el-button></center>
  <center><div id="main" /></center>
</template>

<script setup lang="ts">
import { ElMessage, ElMessageBox } from "element-plus"
import { request } from "@/utils/service"
import { onMounted, ref } from "vue"
import { EChartsOption, init } from "echarts"
import * as echarts from "echarts"
import { Character, ResultResp } from "@/models"

onMounted(() => {
  type EChartsOption = echarts.EChartsOption

  var chartDom = document.getElementById("main")!
  var chart = echarts.init(chartDom)
  var option: EChartsOption
  option = {
    tooltip: {
      trigger: "item"
    },
    legend: {
      top: "5%",
      left: "center"
    },
    series: [
      {
        name: "数量🎲",
        type: "pie",
        radius: ["40%", "70%"],
        avoidLabelOverlap: false,
        itemStyle: {
          borderRadius: 10,
          borderColor: "#fff",
          borderWidth: 2
        },
        label: {
          show: false,
          position: "center"
        },
        emphasis: {
          label: {
            show: true,
            fontSize: "60",
            fontWeight: "bold"
          }
        },
        labelLine: {
          show: false
        },
        data: [
          { value: 3, name: "ISTJ" },

          { value: 3, name: "INFJ" },

          { value: 1, name: "INTJ" },

          { value: 8, name: "ISTP" },

          { value: 3, name: "ISFP" },

          { value: 3, name: "INFP" },

          { value: 4, name: "INTP" },

          { value: 3, name: "ESTP" },

          { value: 3, name: "ESFP" },

          { value: 3, name: "ENFP" },

          { value: 1, name: "ENTP" },

          { value: 3, name: "ESTJ" },

          { value: 2, name: "ESFJ" },

          { value: 3, name: "ENTJ" },

          { value: 3, name: "ENFJ" },

          { value: 3, name: "ISFJ" }
        ]
      }
    ]
  }
  option && chart.setOption(option)
})

const inputClassStr = ref("")
const classResps = ref<ResultResp[]>([])
const get_classRes = (input) => {
  var numBegin = 0
  for (var i = 0; i < input.length; i++) {
    if (input[i] >= "0" && input[i] <= "9") {
      numBegin = i
      break
    }
  }
  // console.log(numBegin, input.substring(0, numBegin), input.substring(numBegin, input.length))
  const dep = input.substring(0, numBegin)
  const cid = input.substring(numBegin, input.length)
  const resurl = "/class/" + dep + "/" + cid
  request({
    url: resurl,
    method: "get"
  }).then((resp) => {
    classResps.value = resp.data.classResps
    console.log("classResps :", classResps)
  })
}
</script>

<style>
#chart {
  width: 1000px;
  height: 400px;
}

#main {
  width: 1000px;
  height: 400px;
}

.input-with-select .el-input-group__prepend {
  background-color: var(--el-fill-color-blank);
}
</style>
