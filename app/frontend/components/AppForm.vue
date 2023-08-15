<template>
  <form :action="action" ref="form" method="POST">
    <input v-if= "isNotPost" name="_method" type="hidden" :value="method"/>
    <input name="authenticity_token" type="hidden" :value="csrfToken"/>
    <slot></slot>
  </form>
</template>

<script>
  export default {
    props: {
      action: {
        type: String,
        required: true,
      },

      method: {
        type: String,
        required: true,
      }
    },

    computed: {
      csrfToken() {
        const metaToken = document.querySelector('meta[name="csrf-token"]');
        if (metaToken) {
          return metaToken.getAttribute('content');
        }
        return null;
      },

      isNotPost() {
        return this.method !== 'post';
      },
    },

    methods: {
      submit(value) {
        this.$refs.form.submit();
      },

    }
  }
</script>