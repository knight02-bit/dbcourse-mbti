<template>
  <center><el-button>软件工程202班</el-button></center>

  <div id="main" />
  <button>kfjdskj</button>
</template>

<script setup lang="ts">
import { ElMessage, ElMessageBox } from "element-plus"

import { onMounted } from "vue"
import { EChartsOption, init } from "echarts"
import * as echarts from "echarts"

onMounted(() => {
  // 获取dom，断言HTMLElement类型，否则会报错
  // const chartEle: HTMLElement = document.getElementById("chart") as HTMLElement
  // const chart = init(chartEle)
  // const option: EChartsOption = {
  //   xAxis: {
  //     type: "category",

  //     data: [
  //       "ISTJ",
  //       "INFJ",
  //       "INTJ",
  //       "ISTP",
  //       "ISFP",
  //       "INFP",
  //       "INTP",
  //       "ESTP",
  //       "ESFP",
  //       "ENFP",
  //       "ENTP",
  //       "ESTJ",
  //       "ESFJ",
  //       "ENTJ",
  //       "ENFJ",
  //       "ISFJ"
  //     ]
  //   },
  //   yAxis: {
  //     type: "value"
  //   },
  //   series: [
  //     {
  //       data: [5, 11, 2, 4, 4, 3, 1, 6, 7, 4, 3, 3, 4, 5, 6, 7],
  //       type: "pie"
  //     }
  //   ]
  // }
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
        name: "Access From",
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
            fontSize: "40",
            fontWeight: "bold"
          }
        },
        labelLine: {
          show: false
        },
        data: [
          { value: 1048, name: "Search Engine" },
          { value: 735, name: "Direct" },
          { value: 580, name: "Email" },
          { value: 484, name: "Union Ads" },
          { value: 300, name: "Video Ads" }
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
