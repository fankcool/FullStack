import { createRouter, createWebHashHistory } from "vue-router";

import App from '@/pages/Main.vue'

const routes = [
  {
    path: '/',
    name: 'App',
    component: App
  },
];

const router = createRouter({
  history: createWebHashHistory(),
  routes,
});

// router.beforeEach((to, from, next) => {
//   console.log('*** >>> to: ', to.path, ', from: ', from.path);
//   if (to.path == '/invite') {
//     next(false);
//   }
//   next()
// })

export default router;