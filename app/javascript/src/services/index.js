import Product from './modules/product.js';

const modules = {
  'product': Product
}

export default {
  call: name => modules[name]
};
