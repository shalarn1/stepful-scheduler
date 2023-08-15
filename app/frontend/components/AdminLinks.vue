<template>
  <div v-for="id in recordIds" >
    <a :href="`/${modelName.route_key}/${id}/edit`">{{modelName.human}} {{id}}</a>
  </div>
</template>

<script>  
  export default {
    props: {
      recordIds: {
        type: Array,
        required: true,
      },

      modelName: {
        type: Object,
        required: true,
      }
    },
  }
</script>