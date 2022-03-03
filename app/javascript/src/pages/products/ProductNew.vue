<template>
  <div class="product-new">
    <product-form :product="product" />
  </div>
</template>

<script>
import ProductForm from './../../components/products/ProductForm.vue';
import Service from '../../services/index.js';
const ProductService = Service.call('product');

export default {
  components: { ProductForm },
  data() {
    return {
      product: {}
    };
  },
  created() {
    this.loadProduct();
  },
  methods: {
    async loadProduct() {
      try {
        const data = await ProductService.new();
        this.product = data.data.product;
      } catch (err) {
        console.log('error', err);
      }
    },
  }
}
</script>
