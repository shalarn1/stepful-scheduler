<template>
  <div>
    <span class='bold'> {{timeBlock.date}} </span>
    <br>
    {{timeBlock.start_time}} - {{timeBlock.end_time}}
    <br>
    <a :href="`/meetings/${meeting.id}`">Meeting {{meeting.id}}</a>
    <span>, </span>
    <a :href="`/students/${meeting.student_id}`"> Student {{meeting.student_id}} </a>
  </div>
  <app-form action="/meeting_feedbacks" method="post">
    <input name="meeting_id" type="hidden" :value="meeting.id"/>
    <div>
      <span> Score: </span>
      <input name='score' list="score-options"/>
      <datalist id="score-options">
        <option v-for="option in options" :value="option">{{option}}</option>
      </datalist>
    </div>
    <div>
      <span> Notes: </span>
      <input name='notes' type="text"/>
    </div>
    <button @click="submit"> Submit </button>
  </app-form>
</template>

<script>
  import AppForm from '../../components/AppForm.vue';

  export default {
    components: {
      AppForm,
    },

    props: {
      meeting: {
        type: Object,
        required: true,
      },
    },

    data() {  
      return {  
        options: [1,2,3,4,5]
      };
    },

    computed: {
      timeBlock() {
        return this.meeting.time_block;
      },
    },
  }
</script>