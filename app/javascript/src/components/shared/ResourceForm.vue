<template>
  <div class="container">
    <div class="card">
      <div class="card-header">
        <slot name="header"></slot>
      </div>
      <div class="card-body">
        <form @submit.prevent="submit">
          <slot name="body"></slot>
          <div class="form-group">
            <router-link :to="redirectBack" class="btn btn-secondary mr-2"
              >Cancel</router-link
            >
            <input
              type="submit"
              class="btn btn-primary"
              value="Submit"
              v-if="!submitBtnDisabled"
            />
            <button class="btn btn-primary" type="button" disabled v-if="submitBtnDisabled">
              <span
                class="spinner-border spinner-border-sm"
                role="status"
                aria-hidden="true"
              ></span>
              {{submittingText}}
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import Service from '../../services/index.js';

export default {
  emit: ['afterSubmit'],
  props: {
    modelValue: {},
    modelName: {
      type: String,
      required: true
    },
    action: {
      type: String,
      required: true
    },
    successMsg: {
      type: String,
      required: true
    },
    redirectTo: {
      type: String,
      required: true
    },
    redirectBack: {
      type: String,
      required: true
    },
    disableSubmit: {
      type: Boolean,
      default: false
    },
    beforeSubmitWarn: {
      type: String,
      default: null
    },
    beforeSubmit: {
      type: Function
    },
    submittingText: {
      type: String,
      default: 'Submitting...'
    }
  },
  data() {
    return {
      isSubmitting: false,
    };
  },
  computed: {
    submitBtnDisabled() {
      return this.disableSubmit || this.isSubmitting;
    }
  },
  methods: {
    submit() {
      this.isSubmitting = true
      this.$nextTick(() => this.submitResource())
    },
    async submitResource() {
      const ResourceService = Service.call(this.modelName)

      if (this.disableSubmit) {
        setTimeout(() => this.submitResource(), 3000);
        return
      }

      if (this.beforeSubmit) this.beforeSubmit();

      if (this.beforeSubmitWarn) {
        this.$emit('afterSubmit', null) //set emit before swalWarn to prevent message from appearing twice because beforeSubmitWarn value is asynchronously added to swalWarn
        swalWarn(this.beforeSubmitWarn).then(result => {
          if (result.value) {
            this.submitForm();
          }
        });
        return;
      }

      try {
        await ResourceService[this.action](this.modelValue)
        this.$swal.fire({
          text: this.message,
          icon: "success",
          position: "top-end",
          timer: 2000,
        });
        this.$router.push({ name: this.redirectTo });
        this.isSubmitting = false
      } catch (err) {
        if (err.response.status === 422) {
          const errors = err.response.data[this.modelName].errors;
          for (const key in errors) {
            errors[key] = errors[key].join(', ');
          }
          this.modelValue.errors = errors;
        } else {
          window.alert(err.response.statusText)
        }
      }
      this.isSubmitting = false
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
