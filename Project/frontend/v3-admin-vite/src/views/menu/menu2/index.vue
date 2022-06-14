<template>
  <div class="app-container">
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
    <center>
      <el-button>{{ inputClassStr }}</el-button>
    </center>
    <center><div id="main" /></center>
    <el-table :data="classResps" stripe style="width: 100%">
      <el-table-column prop="Sid" label="🔢学号" sortable />
      <el-table-column prop="Sname" label="🖍姓名" sortable />
      <el-table-column prop="Rtime" label="🕤时间" sortable />
      <el-table-column prop="Ctype" label="📜测试结果(点击查看详情👇)" sortable>
        <!-- <el-button >{{ Ctype }}</el-button> -->
        <template v-slot="scope">
          <el-button @click="show_description(scope.row.Ctype)">{{ scope.row.Ctype }}</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script setup lang="ts">
import { ElMessage, ElMessageBox } from "element-plus"
import { request } from "@/utils/service"
import { onMounted, ref } from "vue"
import { EChartsOption, init } from "echarts"
import * as echarts from "echarts"
import { Character, ResultResp } from "@/models"
import { title } from "process"

var option: EChartsOption

const charList = [
  "ENFP",
  "ENTJ",
  "ENTP",
  "ESFJ",
  "ESFP",
  "ESTJ",
  "ESTP",
  "ENFJ",
  "INFP",
  "INTJ",
  "INTP",
  "INFJ",
  "ISFJ",
  "ISFP",
  "ISTJ",
  "ISTP"
]
const cntCharacter = {
  ENFJ: 0,
  ENFP: 0,
  ENTJ: 0,
  ENTP: 0,
  ESFJ: 0,
  ESFP: 0,
  ESTJ: 0,
  ESTP: 0,
  INFJ: 0,
  INFP: 0,
  INTJ: 0,
  INTP: 0,
  ISFJ: 0,
  ISFP: 0,
  ISTJ: 0,
  ISTP: 0
}
option = {
  tooltip: {
    trigger: "item"
  },
  legend: {
    top: "3%",
    left: "center"
  },
  series: [
    {
      name: "数量🎲",
      type: "pie",
      radius: ["50%", "80%"],
      avoidLabelOverlap: false,
      itemStyle: {
        borderRadius: 10,
        borderColor: "#fff",
        borderWidth: 5
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
        show: true
      },
      data: [
        { value: 0, name: "ISTJ" },
        { value: 0, name: "INFJ" },
        { value: 0, name: "INTJ" },
        { value: 0, name: "ISTP" },
        { value: 0, name: "ISFP" },
        { value: 0, name: "INFP" },
        { value: 0, name: "INTP" },
        { value: 0, name: "ESTP" },
        { value: 0, name: "ESFP" },
        { value: 0, name: "ENFP" },
        { value: 0, name: "ENTP" },
        { value: 0, name: "ESTJ" },
        { value: 0, name: "ESFJ" },
        { value: 0, name: "ENTJ" },
        { value: 0, name: "ENFJ" },
        { value: 0, name: "ISFJ" }
      ]
    }
  ]
}

const chartInit = () => {
  type EChartsOption = echarts.EChartsOption
  var chartDom = document.getElementById("main")!
  var chart = echarts.init(chartDom)
  option && chart.setOption(option)
}
onMounted(chartInit)

const inputClassStr = ref("")
const classResps = ref<ResultResp[]>([])
const characters = ref<Character[]>([])
let characMapping = new Map()
request({
  url: "/character",
  method: "get"
}).then((resp) => {
  characters.value = resp.data.characters
  console.log("charNum", characters.value.length)

  for (var i = 0; i < characters.value.length; i++) {
    characMapping.set(characters.value[i].Ctype, "💬" + characters.value[i].Ctext)
  }
})

const get_classRes = (input) => {
  var numBegin = 0
  for (var i = 0; i < input.length; i++) {
    if (input[i] >= "0" && input[i] <= "9") {
      numBegin = i
      break
    }
  }
  if (numBegin == 0) {
    ElMessageBox.alert(" ", "🚩 Tip ", {
      message: "格式错误或是暂无数据",
      confirmButtonText: "OK",
      dangerouslyUseHTMLString: true,
      callback: () => {
        ElMessage({
          type: "success",
          message: `☆ 小提示: 专业要用全名哦 ☆ `
        })
      }
    })
    classResps.value = []
  } else {
    const dep = input.substring(0, numBegin)
    const cid = input.substring(numBegin, input.length)
    const resurl = "/class-res/" + dep + "/" + cid
    request({
      url: resurl,
      method: "get"
    }).then((resp) => {
      classResps.value = resp.data.classResps

      //先清零
      for (var i = 0; i < charList.length; i++) {
        cntCharacter[charList[i]] = 0
      }

      if (resp.data.classResps == null) {
        var numKinds = option["series"][0]["data"].length
        for (var i = 0; i < numKinds; i++) {
          //饼图所对应的,性格权值等于性格人数
          var numName = option["series"][0]["data"][i]["name"]
          option["series"][0]["data"][i]["value"] = cntCharacter[numName]
        }
        chartInit()
        ElMessageBox.alert(" ", "🚩 Tip ", {
          message: "格式错误或是暂无数据",
          confirmButtonText: "OK",
          dangerouslyUseHTMLString: true,
          callback: () => {
            ElMessage({
              type: "success",
              message: `☆ 小提示: 专业要用全名哦 ☆ `
            })
          }
        })
      } else {
        for (var i = 0; i < classResps.value.length; i++) {
          //性格人数增加
          cntCharacter[classResps.value[i]["Ctype"]]++
        }
        var numKinds = option["series"][0]["data"].length
        for (var i = 0; i < numKinds; i++) {
          //饼图所对应的,性格权值等于性格人数
          var numName = option["series"][0]["data"][i]["name"]
          option["series"][0]["data"][i]["value"] = cntCharacter[numName]
        }

        //console.log(option["series"][0]["data"])
        chartInit()

        let resString = ""
        var kindnum = 0
        for (var i = 0; i < charList.length; i++) {
          if (cntCharacter[charList[i]] != 0) {
            kindnum++
            resString += charList[i] + " :"
            resString += cntCharacter[charList[i]] + "<br/>"
          }
        }
        let titleStr = "其中出现了" + kindnum + "种人格, 具体数量如下<br/>"
        ElMessageBox.alert(" ", "🚩 Tip <" + inputClassStr.value + "> 共计" + classResps.value.length + "条数据", {
          message: titleStr + resString,
          confirmButtonText: "OK",
          dangerouslyUseHTMLString: true,
          callback: () => {
            ElMessage({
              type: "success",
              message: `☆ 你可以下滑查看具体记录 ☆ `
            })
          }
        })
      }
    })
  }
}

const show_description = (res) => {
  ElMessageBox.alert(characMapping.get(res), "🚩" + res, {
    confirmButtonText: "OK",
    callback: () => {
      ElMessage({
        type: "success",
        message: `☆ ` + res + ` ☆ `
      })
    }
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
