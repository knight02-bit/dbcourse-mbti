<template>
  <div class="app-container">
    <center><el-button>注意: MBTI用来测试性格是有依据的, 建议不要轻易增删</el-button></center>
    <el-table :data="questions" stripe style="width: 100%">
      <el-table-column prop="Qid" label="题标(唯一)" />
      <el-table-column prop="Qtext" label="题目" />
      <el-table-column prop="QAtext" label="A选项" />
      <el-table-column prop="QAvalue" label="特征权值" />
      <el-table-column prop="QBtext" label="A选项" />
      <el-table-column prop="QBvalue" label="特征权值" />
      <el-table-column label="删除">
        <template #default="scope">
          <el-button size="large" type="danger" @click="handleDelete(scope.$index, scope.row)">Delete</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
  <center><el-button type="success" @click="check">新增题目</el-button></center>

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
        <el-form-item label="题目(默认为空)" prop="Qtext">
          <el-input v-model="form.Qtext" autocomplete="off" />
        </el-form-item>
        <el-form-item label="A选项" :label-width="formLabelWidth" prop="QAtext">
          <el-input v-model="form.QAtext" autocomplete="off" />
        </el-form-item>
        <el-form-item label="B选项" :label-width="formLabelWidth" prop="QBtext">
          <el-input v-model="form.QBtext" autocomplete="off" />
        </el-form-item>
        <el-form-item label="" :label-width="formLabelWidth">
          <div class="example-block">
            <el-cascader v-model="value" :options="options" expandTrigger="hover" />
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
import { ref, onBeforeMount, reactive } from "vue"
import { Question } from "@/models"
import { request } from "@/utils/service"
import { ElMessage, ElMessageBox, ElDrawer, FormRules } from "element-plus"
import { useUserStore } from "@/store/modules/user"

const role = useUserStore().roles
const questions = ref<Question[]>([])
const find_question = () => {
  if (role[0] == "student") {
    ElMessageBox.alert("非管理员不可使用", "WARN", {
      confirmButtonText: " ✔ "
    })
  } else {
    request({
      url: "/question",
      method: "get"
    }).then((resp) => {
      questions.value = resp.data.questions
    })
    ElMessage({
      message: "若无显示,请进行刷新",
      type: "success"
    })
  }
}
onBeforeMount(find_question)

const value = ref([])
const formLabelWidth = "80px"
// eslint-disable-next-line no-undef
let timer: NodeJS.Timeout | undefined

const dialog = ref(false)
const loading = ref(false)

const form = reactive({
  Qtext: "",
  QAtext: "",
  QBtext: "",
  QTid: 1,
  QAvalue: "",
  QBvalue: ""
})
const inforRules = reactive<FormRules>({
  QAtext: [{ required: true, message: "请输入A选项内容", trigger: "blur" }],
  QBtext: [{ required: true, message: "请输入B选项内容", trigger: "blur" }]
})
const check = () => {
  if (role[0] == "student") {
    ElMessageBox.alert("非管理员不可使用", "WARN", {
      confirmButtonText: " ✔ "
    })
  } else {
    dialog.value = true
  }
}

const newQuestion = ref<Question[]>([])
const submitForm = () => {
  let isRequest = true
  if (value.value[0] == null || value.value[1] == null) {
    isRequest = false
  } else if (form.QAtext.length == 0 || form.QBtext.length == 0) {
    isRequest = false
  }

  if (isRequest) {
    //console.log("✔")
    newQuestion.value = [
      {
        Qid: 0,
        Qtext: form.Qtext,
        QAtext: form.QAtext,
        QBtext: form.QBtext,
        QTid: form.QTid,
        QAvalue: value.value[0],
        QBvalue: value.value[1]
      }
    ]
    console.log(newQuestion.value[0])
    request({
      url: "/question-add",
      method: "post",
      data: newQuestion.value[0]
    }).then((resp) => {
      if (resp.data["isSuccess"]) {
        ElMessage({
          message: "新增问题成功",
          type: "success"
        })
      } else {
        ElMessage.error("新增问题失败")
      }
    })
    drawerRef.value!.close()
  } else {
    ElMessageBox.alert("", "🚩 Tip ", {
      message: "信息不全",
      confirmButtonText: "OK",
      dangerouslyUseHTMLString: true
    })
  }
}

const drawerRef = ref<InstanceType<typeof ElDrawer>>()
const handleClose = () => {
  if (loading.value) {
    return
  }
  ElMessageBox.confirm("你想要提交吗?")
    .then(() => {
      loading.value = true
      timer = setTimeout(() => {
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

const handleDelete = (index: number, row: Question) => {
  console.log(index, row)
  ElMessageBox.confirm("是否要删除 " + row.Qtext, "WARN", {
    confirmButtonText: "确定",
    cancelButtonText: "取消",
    type: "warning"
  })
    .then(() => {
      request({
        url: "/del-question",
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

// const props = {
//   expandTrigger: "hover"
// }
const options = [
  {
    value: "E",
    label: "E",
    children: [
      {
        value: "I",
        label: "I"
      }
    ]
  },
  {
    value: "I",
    label: "I",
    children: [
      {
        value: "E",
        label: "E"
      }
    ]
  },
  {
    value: "S",
    label: "S",
    children: [
      {
        value: "N",
        label: "N"
      }
    ]
  },
  {
    value: "N",
    label: "N",
    children: [
      {
        value: "S",
        label: "S"
      }
    ]
  },
  {
    value: "T",
    label: "T",
    children: [
      {
        value: "F",
        label: "F"
      }
    ]
  },
  {
    value: "F",
    label: "F",
    children: [
      {
        value: "T",
        label: "T"
      }
    ]
  },
  {
    value: "J",
    label: "J",
    children: [
      {
        value: "P",
        label: "P"
      }
    ]
  },
  {
    value: "P",
    label: "P",
    children: [
      {
        value: "J",
        label: "J"
      }
    ]
  }
]
</script>

<style>
.input-with-select .el-input-group__prepend {
  background-color: var(--el-fill-color-blank);
}
</style>
