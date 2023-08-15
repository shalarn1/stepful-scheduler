class MeetingsController < ApplicationController
	before_action :load_meeting, only: %i[update edit show]
	def edit
		@meeting_json = @meeting.js_args.to_json
	end

	def update
		permitted = permitted_params
		@meeting.update!(status: permitted[:status].to_sym)

		redirect_to action: :edit
	end

	def show
		edit
		render :edit
	end

	private
	def load_meeting
		@meeting = Meeting.find(params[:id])
	end

	def permitted_params
    params.permit(:status, :id, :authenticity_token, :_method)
  end
end