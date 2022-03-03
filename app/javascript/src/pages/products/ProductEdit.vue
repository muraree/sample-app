<template>
  <div class="product-edit">
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
        const data = await ProductService.edit(this.$route.params.id);
        this.product = data.data.product;
      } catch (err) {
        console.log('error', err);
      }
      this.isLoading = false
    },
  }
}
</script>
