class MeetingFeedbacksController < ApplicationController
	before_action :load_meeting, only: %i[new create]
	def new
		@meeting_json = @meeting.js_args.to_json
	end

	def create
		permitted = permitted_params
		@meeting.create_meeting_feedback!(score: permitted[:score].to_i, notes: permitted[:notes], user: @meeting.coach.user)

		redirect_to controller: :meetings, action: :show, id: @meeting.id
	end

	private
	def load_meeting
		@meeting = Meeting.find(params[:meeting_id])
	end

	def permitted_params
    params.permit(:meeting_id, :score, :notes, :id, :authenticity_token, :_method)
  end
end