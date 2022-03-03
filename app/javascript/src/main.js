import { createApp } from 'vue'
import router from './router'
import store from './store'
import App from './App.vue'
import VueSweetalert2 from 'vue-sweetalert2';

import './styles/index.scss';

export default () => {
  document.addEventListener('DOMContentLoaded', () => {
    const app = createApp(App);
    app.use(store)
    app.use(router)
    app.use(VueSweetalert2);
    app.mount('#app')
  })
}
