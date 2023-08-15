class CoachesController < ApplicationController
	before_action :load_coach, only: %i[update edit]

	def index
		@coaches = Coach.all.ids

		mn = Coach.model_name
		@model = {
			human: mn.human,
			route_key: mn.route_key,
		}.to_json
	end

	def edit
		@time_blocks_json = @coach.time_blocks.sort_by(&:start_at).map { |tb| tb.js_args }.to_json
	end

	def update
		permitted = permitted_params
		start_at = DateTime.parse((permitted[:date]))
		end_at = start_at + 2.hours
		@coach.time_blocks.create!(start_at: start_at, end_at: end_at, status: :free)

		redirect_to action: :edit
	end

	private
	def load_coach
		@coach = Coach.find(params[:id])
	end

	def permitted_params
    params.permit(:date, :id, :authenticity_token, :_method)
  end
end