<template>
  <div class="row border-1 p-2">
    <div class="col-2">{{ product.name }}</div>
    <div class="col-2"><strong class="text-danger">$ {{ parseFloat(product.price).toFixed(2) }}</strong></div>
    <div class="col-2"><strong class="text-success">{{anyImage}}</strong></div>
    <div class="col-2"><span class="badge badge-info">{{product.created_at}}</span></div>
    <div class="col-4">
      <router-link
        :to="{ name: 'ProductShow', params: { id: product.id } }"
        class="btn btn-success"
        title="View Product">
        <i class="fa fa-eye"></i>
      </router-link>
      <router-link
        :to="{ name: 'ProductEdit', params: { id: product.id } }"
        class="btn btn-primary ml-2"
        title="Edit Product">
        <i class="fa fa-pencil"></i>
      </router-link>
      <router-link
        :to="{ name: 'ProductUpload', params: { id: product.id } }"
        class="btn btn-warning ml-2"
        title="Upload Product Image">
        <i class="fa fa-upload"></i>
      </router-link>
      <button
        class="btn btn-danger ml-2"
        @click="deleteProductModal(product.id)"
        title="Delete Product">
        <i class="fa fa-trash"></i>
      </button>
    </div>
  </div>
</template>

<script>
export default {
  name: "ProductList",
  emit:['deleteProduct'],
  props: {
    product: {
      type: Object,
    },
    index: {
      type: Number,
    },
  },
  computed: {
    anyImage() {
      return !!this.product.image_url ? 'Yes' : 'No'
    }
  },
  methods: {
    deleteProductModal(id) {
      this.$swal
        .fire({
          text: "Are you sure to delete the product ?",
          icon: "error",
          cancelButtonText: "Cancel",
          confirmButtonText: "Yes, Confirm Delete",
          showCancelButton: true,
        })
        .then((result) => {
          if (result["isConfirmed"]) {
            // Put delete logic
            this.$emit('deleteProduct', id)
          }
        });
    },
  },
};
</script>
