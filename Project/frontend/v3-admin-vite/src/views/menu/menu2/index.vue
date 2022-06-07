<template>
  <center><el-button>软件工程202班</el-button></center>
  <center><div id="main" /></center>
</template>

<script setup lang="ts">
import { ElMessage, ElMessageBox } from "element-plus"

import { onMounted } from "vue"
import { EChartsOption, init } from "echarts"
import * as echarts from "echarts"

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
</script>

<style>
/* #app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #e84a4a;
  margin-top: 60px;
} */

#chart {
  width: 1000px;
  height: 400px;
}

#main {
  width: 1000px;
  height: 400px;
}
</style>
