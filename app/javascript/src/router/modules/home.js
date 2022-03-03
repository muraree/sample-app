export default [
  { path: '/', redirect: '/home' },
  {
    path: '/home',
    name: 'Home',
    component: () => import('../../pages/Home.vue')
  },
  {
    path: '/help',
    name: 'Help',
    component: () => import('../../pages/Helper.vue')
  },
  {
    path: '/about',
    name: 'About',
    component: () => import('../../pages/About.vue')
  },
]
