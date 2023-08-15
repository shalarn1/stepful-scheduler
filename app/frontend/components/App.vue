<script> 
  import NavBar from '../components/NavBar.vue';  
  import Scheduler from '../components/students/scheduler.vue';
  import CalendarSelector from '../components/coaches/CalendarSelector.vue';
  import TimeBlocksList from '../components/coaches/TimeBlocksList.vue';
  import AppForm from '../components/AppForm.vue';
  import MeetingEdit from '../components/meetings/Edit.vue';
  import MeetingFeedbacksNew from '../components/meeting_feedbacks/New.vue';
  import AdminLinks from '../components/AdminLinks.vue';

  export default {
    components: {
      NavBar,
      Scheduler,
      CalendarSelector,
      TimeBlocksList,
      AppForm,
      MeetingEdit,
      MeetingFeedbacksNew,
      AdminLinks,
    },
  }
</script>
<style>
  .free {
    background-color: #80ed9d;
  }

  .booked {
    background-color: #fcd1cf;
  }

  .card {
    width: 20%;
    padding: 8px;
  }

  .bold {
    font-weight: 700;
  }

  .m-r {
    margin-right: 8px;
  }

  .m-t {
    margin-top: 8px;
  }

  input, button {
    margin-top: 8px;
  }
</style>