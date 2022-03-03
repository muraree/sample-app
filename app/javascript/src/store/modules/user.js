// initial state
export default {
  namespaced: true,
  state: {
    user: {}
  },
  getters: {
    id(state) {
      return state.user.id;
    },
    name(state) {
      return state.user.name;
    },
    role(state) {
      return state.user.role;
    },
  },
  actions: {
    setUser({ commit }, user) {
      commit('setUser', user);
    }
  },
  mutations: {
    setUser(state, payload) {
      state.user = payload;
    }
  }
}
