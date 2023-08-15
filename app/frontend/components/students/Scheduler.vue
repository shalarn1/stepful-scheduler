<template>  
   <app-form :action="`/students/${studentId}`" method="patch">
     <time-blocks-list :student-id="studentId" :time-blocks="timeBlocks"></time-blocks-list>
   </app-form>
</template>

<script>
  import AppForm from '../../components/AppForm.vue';
  import TimeBlocksList from '../../components/coaches/TimeBlocksList.vue';

  export default {
    components: {
      AppForm,
      TimeBlocksList
    },

    props: {
      timeBlocks: {
        type: Array,
        required: true,
      },
      studentId: {
        type: Number,
        default: null,
      }
    }
  }
</script>