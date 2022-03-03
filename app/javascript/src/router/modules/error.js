export default [
  {
    path: '/error',
    component: () => import('../../components/layouts/errors/500.vue')
  },
  {
    path: '/notfound',
    component: () => import('../../components/layouts/errors/404.vue'),
    name: 'NotFound'
  },
  {
    path: '/:catchAll(.*)',
    redirect: '/notfound'
  },
]
