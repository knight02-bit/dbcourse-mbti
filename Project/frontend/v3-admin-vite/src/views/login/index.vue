<script lang="ts" setup>
import { reactive, ref } from "vue"
import { useRouter } from "vue-router"
import { resetRouter } from "@/router"
import { useUserStore } from "@/store/modules/user"
import { User, Lock, Key } from "@element-plus/icons-vue"
import ThemeSwitch from "@/components/ThemeSwitch/index.vue"

interface ILoginForm {
  /** admin 或 editor */
  username: string
  /** 密码 */
  password: string
}

const router = useRouter()
const loginFormDom = ref<any>()

const state = reactive({
  /** 登录按钮 loading */
  loading: false,

  /** 登录表单 */
  loginForm: {
    username: "",
    password: ""
  } as ILoginForm,
  /** 登录表单校验规则 */
  loginRules: {
    username: [{ required: true, message: "请输入用户名", trigger: "blur" }],
    password: [
      { required: true, message: "请输入密码", trigger: "blur" },
      { min: 8, max: 16, message: "长度在 8 到 16 个字符", trigger: "blur" }
    ]
  },
  // 登录逻辑
  handleLogin: () => {
    resetRouter()
    loginFormDom.value.validate((valid: boolean) => {
      if (valid) {
        state.loading = true
        useUserStore()
          .login({
            username: state.loginForm.username,
            password: state.loginForm.password
          })
          .then(() => {
            state.loading = false
            router.push({ path: "/" }).catch((err) => {
              console.warn(err)
              console.log("登录失败A")
            })
          })
          .catch(() => {
            state.loading = false
            state.loginForm.password = ""
            console.log("登录失败B")
          })
      } else {
        console.log("登录失败C")
        return false
      }
    })
  }
})
</script>

<template>
  <div class="login-container">
    <!-- <ThemeSwitch class="theme-switch" /> -->
    <div class="login-card">
      <div class="title">
        <img src="@/assets/layout/login-logo.png" />
      </div>
      <div class="content">
        <el-form ref="loginFormDom" :model="state.loginForm" :rules="state.loginRules" @keyup.enter="state.handleLogin">
          <el-form-item prop="username">
            <el-input
              v-model="state.loginForm.username"
              placeholder="用户名"
              type="text"
              tabindex="1"
              :prefix-icon="User"
              size="large"
            />
          </el-form-item>

          <el-form-item prop="password">
            <el-input
              v-model="state.loginForm.password"
              placeholder="密码"
              type="password"
              tabindex="2"
              :prefix-icon="Lock"
              size="large"
              show-password
            />
          </el-form-item>

          <center>
            <el-button :loading="state.loading" type="primary" size="large" @click.prevent="state.handleLogin">
              登 录
            </el-button>
          </center>
        </el-form>
      </div>
    </div>
  </div>
</template>

<style lang="scss" scoped>
.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  min-height: 100%;
  .theme-switch {
    position: fixed;
    top: 5%;
    right: 5%;
    cursor: pointer;
  }
  .login-card {
    width: 480px;
    border-radius: 20px;
    box-shadow: 0 0 10px #dcdfe6;
    background-color: #fff;
    overflow: hidden;

    .title {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 150px;
      img {
        height: 100%;
      }
    }
    .content {
      padding: 20px 50px 50px 50px;
      .show-code {
        position: absolute;
        right: 0px;
        top: 0px;
        cursor: pointer;
        user-select: none;
        img {
          width: 100px;
          height: 40px;
          border-radius: 4px;
        }
      }
      .el-button {
        width: 50%;
        margin-top: 10px;
      }
    }
  }
}
</style>
