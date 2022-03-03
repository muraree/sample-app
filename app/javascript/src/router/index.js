import { createRouter, createWebHistory } from 'vue-router';
import error from './modules/error.js';
import home from './modules/home.js';
import product from './modules/product.js';
import NProgress from 'nprogress';

const routes = [
  ...error,
  ...home,
  ...product
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

router.beforeResolve((to, from, next) => {
  if (to.name) {
    NProgress.start()
  }
  next()
});

router.afterEach(() => {
  NProgress.done()
});

export default router;
