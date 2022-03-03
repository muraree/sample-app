<template>
  <resource-form modelName="product" v-model="product" :successMsg="successMsg" redirectTo="Products" redirectBack="/products" :action="action">
    <template #header><!-- using the shorthand for `v-slot` -->
      <h6>{{ product.id ? 'Edit' : 'Add' }} Product</h6>
    </template>
    <template #body><!-- using the shorthand for `v-slot` -->
      <div class="form-group row">
        <div class="col-6" :class="{invalid: product.errors && product.errors.name}">
          <label>Product Name:</label>
          <input type="text" class="form-control" min="0" step=".01" v-model="product.name" />
          <span class='invalid' v-if="product.errors">{{product.errors.name}}</span>
        </div>
        <div class="col-6" :class="{invalid: product.errors && product.errors.price}">
          <label>Product Price:</label>
          <input type="number" class="form-control" v-model="product.price" />
          <span class='invalid' v-if="product.errors">{{product.errors.price}}</span>
        </div>
      </div>
      <div class="form-group row">
        <div class="col-12">
          <label>Product Details:</label>
          <textarea class="form-control" v-model="product.description" />
          <span class='error' v-if="product.errors">{{product.errors.description}}</span>
        </div>
      </div>
    </template>
  </resource-form>
</template>

<script>
import ResourceForm from '../shared/ResourceForm.vue'

export default {
  components: { ResourceForm },
  props: {
    product: {
      type: Object,
    },
  },
  computed: {
    action() {
      return this.product.id ? 'update' : 'create'
    },
    successMsg() {
      return `Success, Product has been ${ this.product.id ? 'updated' : 'added' }.`
    }
  },
};
</script>

<style scoped>
.invalid span {
  color: #d9534f;
}
.invalid input,
.invalid textarea {
  border: 1px solid #d9534f;
}
</style>
