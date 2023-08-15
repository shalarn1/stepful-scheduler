<template>
  <div class='m-t'> Calendar </div>
  <div v-if="timeBlocks.length > 0">
    <span class="free m-r"> Available Times </span>
    <span v-if="studentId == null" class="booked"> Appointment booked </span>
    <time-block-card v-for="block in timeBlocks" :time-block="block" :isForm="studentId != null"></time-block-card>
  </div>
  <div v-else> No times have been added yet </div>
</template>

<script>
  import TimeBlockCard from '../../components/coaches/TimeBlockCard.vue';
  export default {
    components: {
      TimeBlockCard
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