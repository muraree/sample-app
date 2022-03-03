import { createStore } from 'vuex';
import author from './modules/author.js';
import user from './modules/user.js';

const store = createStore({
  modules: {
    author,
    user
  },
})

export default store;
