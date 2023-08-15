# == Schema Information
#
# Table name: meetings
#
#  id            :bigint           not null, primary key
#  coach_id      :bigint           indexed
#  student_id    :bigint           indexed
#  time_block_id :bigint           indexed
#  status        :integer          default("scheduled"), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Meeting < ApplicationRecord
	validate :validate_coach_time_block

	belongs_to :coach
	belongs_to :student
	belongs_to :time_block
	has_one :meeting_feedback

	enum status: %i[scheduled open closed]

	after_save_commit :book_time_block
	after_destroy_commit :free_time_block

  def book_time_block
  	time_block.booked!
  end

  def free_time_block
  	time_block.free!
  end

  def js_args
  	{
  		id: id,
			coach_id: coach_id,
			student_id: student_id,
			status: status,
			time_block: time_block.js_args,
			meeting_feedback: meeting_feedback&.js_args
  	}
  end

  def validate_coach_time_block
    if time_block.coach_id != coach_id
    	errors.add(:coach, message: 'Meeting and TimeBlock have mismatching coaches')
    end
  end
end
