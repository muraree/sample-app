<template>
  <div class="container">
    <div class="row justify-content-center mt-2 mb-2">
      <div class="col-8">
        <h4 class="text-left mb-2">All Products</h4>
      </div>
      <div class="col-4">
        <input
          type="text"
          class="form-control"
          placeholder="Search Products..."
          @input="searchProduct"
          v-model="search"
        />
      </div>
    </div>
    <div class="">
      <div class="">
        <div class="row border-bottom border-top p-2 bg-light">
          <div class="col-2">Product Name</div>
          <div class="col-2">Product Price</div>
          <div class="col-2">Image Upload</div>
          <div class="col-2">Created on</div>
          <div class="col-4">Actions</div>
        </div>
        <div v-for="(product, index) in products" :key="product.id">
          <product-list
            :index="index"
            :product="product"
            @deleteProduct="deleteProduct"/>
        </div>
      </div>
    </div>

    <!-- Insert Pagination Part -->
    <v-pagination
      v-if="pagination"
      class="vertical-center mt-2 mb-5"
      v-model="pagination.page"
      :pages="pagination.last"
      :range-size="1"
      active-color="#DCEDFF"
      @update:modelValue="updateHandler"
    />
  </div>
</template>

<script>
import ProductList from './../../components/products/ProductList.vue';
import VPagination from "@hennge/vue3-pagination";
import { debounce } from "debounce";
import Service from '../../services/index.js';
const ProductService = Service.call('product');

export default {
  components: { ProductList, VPagination },
  data() {
    return {
      products: [],
      isLoading: false,
      pagination: null,
      search: null,
    };
  },
  computed: {
    user() {
      return this.$store.getters['user/role']
    }
  },
  created() {
    this.loadProducts();
  },
  methods: {
    async loadProducts() {
      this.isLoading = true;
      try {
        const data = await ProductService.index(this.$route.query);
        this.products = data.data.products;
        this.pagination = data.data.meta.pagination;
      } catch (err) {
        console.log('error', err);
      }
      this.isLoading = false;
      this.$emit('totalProduct', this.pagination.count)
    },
    async deleteProduct(id) {
      try {
        await ProductService.destroy(id);
      } catch (err) {
        console.log('error', err);
      }
      this.loadProducts();
      this.$swal.fire({
        text: "Success, Product has been deleted.",
        icon: "success",
        position: 'top-end',
        timer: 1000,
      });
    },
    updateHandler(page) {
      this.$route.query.page = page;
      this.loadProducts();
    },
    searchProduct() {
      this.$route.query.q = this.search;
      this.$route.query.page = 1;
    }
  },
  watch: {
    search: {
      handler: debounce(function() {
        this.loadProducts()
      }, 1000),
      deep: true
    }
  }
}
</script>
