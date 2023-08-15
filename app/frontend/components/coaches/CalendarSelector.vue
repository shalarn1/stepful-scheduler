<template>
  <app-form :action="`/coaches/${coachId}`" method="patch">
    <date-picker v-model:value="date" type="datetime" minute-step="30" :show-second="false" class="m-r"></date-picker>
    <button @click="submit">Submit</button>
  </app-form>
</template>

<script>
  import AppForm from '../../components/AppForm.vue';
  import DatePicker from 'vue-datepicker-next';
  import 'vue-datepicker-next/index.css';

  export default {
    components: {
      AppForm,
      DatePicker
    },

    props: {
      coachId: {
        type: Number,
        required: true,
      },
    },

    data() {  
      return {  
        date: null,
      };
    },
  }
</script>