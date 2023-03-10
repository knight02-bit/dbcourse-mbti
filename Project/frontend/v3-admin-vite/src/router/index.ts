import { template } from "lodash"
import { createRouter, createWebHashHistory, RouteRecordRaw } from "vue-router"
const Layout = () => import("@/layout/index.vue")

/** 常驻路由 */
export const constantRoutes: Array<RouteRecordRaw> = [
  {
    path: "/redirect",
    component: Layout,
    meta: {
      hidden: true
    },
    children: [
      {
        path: "/redirect/:path(.*)",
        component: () => import("@/views/redirect/index.vue")
      }
    ]
  },
  {
    path: "/login",
    component: () => import("@/views/login/index.vue"),
    meta: {
      hidden: true
    }
  },
  {
    path: "/unocss",
    component: Layout,
    redirect: "/question/index",
    children: [
      {
        path: "index",
        component: () => import("@/views/question/index.vue"),
        name: "Question",
        meta: {
          title: "开始测试",
          icon: "unocss"
        }
      }
    ]
  },
  {
    path: "/menu",
    component: Layout,
    redirect: "/menu/menu1",
    name: "Menu",
    meta: {
      title: "相关数据",
      icon: `menu`
    },
    children: [
      {
        path: "menu1",
        component: () => import("@/views/menu/menu1/index.vue"),
        name: "Menu1",
        meta: { title: "查看测试历史记录" }
      },
      {
        path: "menu2",
        component: () => import("@/views/menu/menu2/index.vue"),
        name: "Menu2",
        meta: { title: "班级测试可视化" }
      }
    ]
  },
  {
    path: "/manage",
    component: Layout,
    redirect: "/manage/questionManage",
    name: "Manage",
    meta: {
      title: "后台管理",
      icon: `lock`
    },
    children: [
      {
        path: "questionManage",
        component: () => import("@/views/manage/questionManage/index.vue"),
        name: "QuestionManage",
        meta: { title: "题库管理" }
      },
      {
        path: "resultManage",
        component: () => import("@/views/manage/resultManage/index.vue"),
        name: "ResultManage",
        meta: { title: "测试记录管理" }
      },
      {
        path: "studentManage",
        component: () => import("@/views/manage/studentManage/index.vue"),
        name: "StudentManage",
        meta: { title: "学生系统管理" }
      }
    ]
  },
  {
    path: "/link",
    component: Layout,
    children: [
      {
        path: "https://knight-02.gitee.io/",
        component: () => {},
        name: "Link",
        meta: {
          title: "关于作者",
          icon: "link"
        }
      }
    ]
  }
]

/**
 * 动态路由
 * 用来放置有权限（roles 属性）的路由
 * 必须带有 name 属性
 */
export const asyncRoutes: Array<RouteRecordRaw> = [
  {
    path: "/:pathMatch(.*)*", // 必须将 'ErrorPage' 路由放在最后, Must put the 'ErrorPage' route at the end
    component: Layout,
    redirect: "/404",
    name: "ErrorPage",
    meta: {
      title: "首页",
      icon: "404",
      hidden: true
    },
    children: [
      {
        path: "401",
        component: () => import("@/views/error-page/401.vue"),
        name: "401",
        meta: {
          title: "401"
        }
      },
      {
        path: "404",
        component: () => import("@/views/question/index.vue"),
        name: "404",
        meta: {
          title: "开始测试"
        }
      }
    ]
  }
]

const router = createRouter({
  history: createWebHashHistory(),
  routes: constantRoutes
})

/** 重置路由 */
export function resetRouter() {
  // 注意：所有动态路由路由必须带有 name 属性，否则可能会不能完全重置干净
  try {
    router.getRoutes().forEach((route) => {
      const { name, meta } = route
      if (name && meta.roles?.length) {
        router.hasRoute(name) && router.removeRoute(name)
      }
    })
  } catch (error) {
    // 强制刷新浏览器，体验不是很好
    window.location.reload()
  }
}

export default router
