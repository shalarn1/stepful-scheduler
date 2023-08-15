class StudentsController < ApplicationController
	before_action :load_student, only: %i[update edit]

	def index
		@students = Student.all.ids

		mn = Student.model_name
		@model = {
			human: mn.human,
			route_key: mn.route_key,
		}.to_json
	end

	def edit
		@time_blocks_json = TimeBlock.free.sort_by(&:start_at).map { |tb| tb.js_args }.to_json
	end

	def update
		permitted = permitted_params
		time_block = TimeBlock.find(permitted[:time_block_id])
		@student.meetings.create!(time_block: time_block, coach: time_block.coach)

		redirect_to action: :edit
	end

	private
	def load_student
		@student = Student.find(params[:id])
	end

	def permitted_params
    params.permit(:time_block_id, :id, :authenticity_token, :_method)
  end
end