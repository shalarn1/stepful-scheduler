<template>
  <span> {{timeBlock.date}} </span>
  <br>
  <span> {{timeBlock.start_time}} - {{timeBlock.end_time}} </span>
  <br>
  <a :href="`/students/${meeting.student_id}`"> Student {{meeting.student_id}} </a>
  <br>
  <span> Status: {{meeting.status}} </span>
  <br>
  <app-form v-if="isEditable" :action="`/meetings/${meeting.id}`" method="patch">
    <button name="status" :value="newStatus" @click="submit"> {{buttonText}} </button>
  </app-form>
  <a v-else-if="feedback == null" :href="`/meeting_feedbacks/new?meeting_id=${meeting.id}`">
    <button> Submit Meeting Feedback </button>
  </a>
  <div v-else class="m-t">
    <span class="bold"> Meeting Feedback </span>
    <br>
    Score: {{feedback.score}}
    <br>
    Notes: {{feedback.notes}}
  </div>
</template>

<script>
  import AppForm from '../../components/AppForm.vue';
  import TimeBlockCard from '../../components/coaches/TimeBlockCard.vue';

  export default {
    components: {
      AppForm,
      TimeBlockCard
    },

    props: {
      meeting: {
        type: Object,
        required: true,
      },
    },

    data() {  
      return {  
        newStatus: null
      };
    },

    computed: {
      timeBlock() {
        return this.meeting.time_block;
      },

      feedback() {
        return this.meeting.meeting_feedback;
      },

      isEditable() {
        return this.meeting.status === 'scheduled' || this.meeting.status === 'open'
      },

      buttonText() {
        if (this.meeting.status === 'scheduled') {
          return 'Start Meeting';
        } else if (this.meeting.status === 'open') {
          return 'End Meeting';
        }
      },
    },

    mounted() {
      if (this.meeting.status === 'scheduled') {
        this.newStatus = 'open';
      } else if (this.meeting.status === 'open') {
        this.newStatus = 'closed';
      }
    }
  }
</script>