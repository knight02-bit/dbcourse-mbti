<template>
  <div class="app-container">
    <div>
      <el-input
        v-model="inputStr"
        stripe
        placeholder="右边选择查询方式:  学院 / 系别 / 班级 / 学号 / 名字"
        class="input-with-select"
      >
        <template #prepend>
          <el-button @click="find_student(inputStr)">🔍</el-button>
        </template>
        <template #append>
          <el-select v-model="selectKind" placeholder="选择" style="width: 200px">
            <el-option label="学院(如: 计算机科学与工程学院)" value="cg" />
            <el-option label="系别(如: 软件工程)" value="dep" />
            <el-option label="班级(系别+班级号, 如: 软件工程202)" value="depclass" />
            <el-option label="学号" value="id" />
            <el-option label="名字" value="name" />
          </el-select>
        </template>
      </el-input>
    </div>
    <el-table :data="studentInfoes" stripe style="width: 100%">
      <el-table-column prop="Sid" label="学号" sortable />
      <el-table-column prop="Sname" label="姓名" sortable />
      <el-table-column prop="CGname" label="学院" sortable />
      <el-table-column prop="Dname" label="系别" sortable />
      <el-table-column prop="Cid" label="班级" sortable />

      <el-table-column label="删除">
        <template #default="scope">
          <el-button size="large" type="danger" @click="handleDelete(scope.$index, scope.row)">Delete</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
  <center><el-button type="success" @click="dialog = true">新增学生</el-button></center>

  <el-drawer
    ref="drawerRef"
    v-model="dialog"
    title="请填入相关信息"
    :before-close="handleClose"
    direction="ltr"
    custom-class="demo-drawer"
  >
    <div class="demo-drawer__content">
      <el-form :model="form" :rules="inforRules" status-icon>
        <el-form-item label="姓名" :label-width="formLabelWidth" prop="Sname">
          <el-input v-model="form.Sname" autocomplete="off" />
        </el-form-item>
        <el-form-item label="学号" :label-width="formLabelWidth" prop="Sid">
          <el-input v-model="form.Sid" autocomplete="off" />
        </el-form-item>
        <el-form-item label="" :label-width="formLabelWidth">
          <div class="example-block">
            <el-cascader v-model="value" :options="options" :props="props" @change="handleChange" />
          </div>
        </el-form-item>
        <el-form-item>
          <center>
            <div class="demo-drawer__footer">
              <el-button @click="cancelForm">取消</el-button>
              <el-button type="primary" :loading="loading" @click="submitForm">提交</el-button>
            </div>
          </center>
        </el-form-item>
      </el-form>
    </div>
  </el-drawer>
</template>

<script setup lang="ts">
import { ref, reactive } from "vue"
import { StudentInfo } from "@/models"
import { request } from "@/utils/service"
import { ElMessage, ElMessageBox, FormRules, ElDrawer } from "element-plus"

const inputStr = ref("")
const selectKind = ref("id")

const studentInfoes = ref<StudentInfo[]>([])
const find_student = (inputStr) => {
  let findStr = ""
  if (selectKind.value == "cg") findStr += "/info-cg/" + inputStr
  else if (selectKind.value == "dep") findStr += "/info-dep/" + inputStr
  else if (selectKind.value == "depclass") {
    var numBegin = 0
    for (var i = 0; i < inputStr.length; i++) {
      if (inputStr[i] >= "0" && inputStr[i] <= "9") {
        numBegin = i
        break
      }
    }
    const dep = inputStr.substring(0, numBegin)
    const cid = inputStr.substring(numBegin, inputStr.length)
    findStr += "/info-depclass/" + dep + "/" + cid
  } else if (selectKind.value == "id") findStr += "/info-id/" + inputStr
  else if (selectKind.value == "name") findStr += "/info-name/" + inputStr
  request({
    url: findStr,
    method: "get"
  }).then((resp) => {
    studentInfoes.value = resp.data.studentInfoes
  })
}

const handleDelete = (index: number, row: StudentInfo) => {
  ElMessageBox.confirm("是否要删除" + row.Sid, "WARN", {
    confirmButtonText: "确定",
    cancelButtonText: "取消",
    type: "warning"
  })
    .then(() => {
      request({
        url: "/del-student",
        method: "delete",
        data: row
      })
      ElMessage({
        type: "success",
        message: "删除成功"
      })
    })
    .catch(() => {
      ElMessage({
        type: "info",
        message: "取消删除操作"
      })
    })
}

const formLabelWidth = "80px"
let timer

const dialog = ref(false)
const loading = ref(false)

const form = reactive({
  Sid: "",
  Sname: "",
  Cid: "",
  Dname: "",
  CGname: ""
})

const drawerRef = ref<InstanceType<typeof ElDrawer>>()
const handleClose = (done) => {
  if (loading.value) {
    return
  }
  ElMessageBox.confirm("你想要提交吗?")
    .then(() => {
      loading.value = true
      timer = setTimeout(() => {
        done()
        // 动画关闭需要一定的时间
        setTimeout(() => {
          loading.value = false
        }, 400)
      }, 2000)
    })
    .catch(() => {
      // catch error
    })
}

const cancelForm = () => {
  loading.value = false
  dialog.value = false
  clearTimeout(timer)
}

const value = ref([])
const student = ref<StudentInfo[]>([])
const submitForm = () => {
  let isRequest = true
  // console.log(value.value[0], value.value[1], value.value[2])
  // console.log(form.Sid, form.Sname)
  if (value.value[0] == null || value.value[1] == null || value.value[2] == null) {
    isRequest = false
  } else if (form.Sname.length == 0 || form.Sid.length != 10) {
    isRequest = false
  } else {
    for (var i = 0; i < form.Sid.length; i++) {
      if (form.Sid[i] > "9" || form.Sid[i] < "0") {
        isRequest = false
        break
      }
    }
  }

  if (isRequest) {
    //console.log("✔")
    student.value = [
      {
        Sid: form.Sid,
        Sname: form.Sname,
        CGname: value.value[0],
        Dname: value.value[1],
        Cid: value.value[2]
      }
    ]

    request({
      url: "/student-add",
      method: "post",
      data: student.value[0]
    }).then((resp) => {
      if (resp.data["isSuccess"]) {
        ElMessage({
          message: "新增成功",
          type: "success"
        })
      } else {
        ElMessage.error("新增失败, 该学号已被使用")
      }
    })
    drawerRef.value!.close()
  } else {
    ElMessageBox.alert("", "🚩 Tip ", {
      message: "信息不全or格式有误",
      confirmButtonText: "OK",
      dangerouslyUseHTMLString: true,
      callback: () => {
        ElMessage({
          type: "info",
          message: `☆ 小提示: 学号为10位数字 ☆ `
        })
      }
    })
  }
}
const inforRules = reactive<FormRules>({
  sname: [{ required: true, message: "请输入姓名", trigger: "blur" }],
  sid: [
    {
      required: true,
      message: "请输入十位的学号",
      trigger: "blur"
    }
  ]
})

const props = {
  expandTrigger: "hover"
}

const handleChange = (value) => {}

const options = [
  {
    value: "计算机科学与工程学院",
    label: "计算机科学与工程学院",
    children: [
      {
        value: "软件工程",
        label: "软件工程",
        children: [
          {
            value: "201",
            label: "201"
          },
          {
            value: "202",
            label: "202"
          },
          {
            value: "203",
            label: "203"
          },
          {
            value: "204",
            label: "204"
          }
        ]
      },
      {
        value: "网络工程",
        label: "网络工程",
        children: [
          {
            value: "201",
            label: "201"
          },
          {
            value: "202",
            label: "202"
          },
          {
            value: "203",
            label: "203"
          },
          {
            value: "204",
            label: "204"
          }
        ]
      },
      {
        value: "计算机科学与技术",
        label: "计算机科学与技术",
        children: [
          {
            value: "201",
            label: "201"
          },
          {
            value: "202",
            label: "202"
          },
          {
            value: "203",
            label: "203"
          },
          {
            value: "204",
            label: "204"
          }
        ]
      }
    ]
  }
]
</script>

<style>
.input-with-select .el-input-group__prepend {
  background-color: var(--el-fill-color-blank);
}
.example-block {
  margin: 1rem;
}
.example-demonstration {
  margin: 1rem;
}
</style>
