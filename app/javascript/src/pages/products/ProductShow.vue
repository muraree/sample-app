<template>
  <div class="container">
    <div class="card">
      <div class="card-header">
        <slot name="header"></slot>
      </div>
      <div class="card-body">
        <div class="form-group row">
          <div class="col-6">
            <label>Product Name:</label>&nbsp;
            <span>{{product.name}}</span>
          </div>
          <div class="col-6">
            <label>Product Price:</label>&nbsp;
            <span>{{`$${parseFloat(product.price).toFixed(2)}`}}</span>
          </div>
        </div>
        <div class="form-group row">
          <div class="col-12">
            <label>Product Details:</label>&nbsp;
            <span>{{product.description}}</span>
          </div>
        </div>
        <div class="form-group row">
          <div class="col-12">
            <label>Product Image:</label>
            <div v-if="product.image">
              <br>
              <img :src="this.product.url" class="img-thumbnail">
            </div>
            <span v-else>
              No image uploaded
            </span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Service from '../../services/index.js';
const ProductService = Service.call('product');

export default {
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
        const data = await ProductService.show(this.$route.params.id);
        this.product = data.data.product;
      } catch (err) {
        console.log('error', err);
      }
      this.isLoading = false
    },
  }
}
</script>

<style lang="scss">
  .image {
    width: 100%;
    height: auto;
  }
</style>
