<template>
  <div :class="[statusClass, 'card', 'm-t']">
    <component :is="timeBlock.free ? 'span' : 'a'" :href="path">
      <span> {{timeBlock.date}} </span>
      <br>
      <span> {{timeBlock.start_time}} - {{timeBlock.end_time}} </span>
      <br>
      <span v-if="timeBlock.coach_id" class='m-r' >Coach {{timeBlock.coach_id}}</span>
      <button v-if="isForm" name="time_block_id" :value="timeBlock.id" @click="submit">Book</button>
    </component>
  </div>
</template>

<script>  
export default {
  props: {
    timeBlock: {
      type: Object,
      required: true,
    },
    isForm: {
      type: Boolean,
      default: false,
    }
  },

  computed: {
    statusClass() {
      if (this.timeBlock.free) {
        return 'free';
      }
      return 'booked';
    },

    path() {
      if (!this.timeBlock.meeting_id) {
        return '';
      }
      return `/meetings/${this.timeBlock.meeting_id}/edit`;
    }
  }
}
</script>