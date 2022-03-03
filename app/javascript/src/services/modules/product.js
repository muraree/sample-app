import $axios from '../axios.js';
const resource = 'products';

export default {
  index(payload) {
    return $axios.get(`/api/${resource}.json`, { params: payload });
  },
  show(id) {
    return $axios.get(`/api/${resource}/${id}.json`);
  },
  new() {
    return $axios.get(`/api/${resource}/new.json`);
  },
  create(payload) {
    return $axios.post(`/api/${resource}.json`, payload);
  },
  edit(id) {
    return $axios.get(`/api/${resource}/${id}/edit.json`)
  },
  update(payload) {
    return $axios.patch(`/api/${resource}/${payload.id}.json`, payload);
  },
  destroy(id) {
    return $axios.delete(`/api/${resource}/${id}.json`)
  },

  // MANY OTHER ENDPOINT RELATED STUFFS
};
