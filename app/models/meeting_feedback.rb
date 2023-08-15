# == Schema Information
#
# Table name: meeting_feedbacks
#
#  id         :bigint           not null, primary key
#  meeting_id :bigint           indexed
#  user_id    :bigint           indexed
#  notes      :text
#  score      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MeetingFeedback < ApplicationRecord
	validate :validate_author_type

	belongs_to :meeting
	belongs_to :user

	def js_args
  	{
  		id: id,
			meeting_id: meeting_id,
			score: score,
			notes: notes,
  	}
  end

  def validate_author_type
  	if user.role_type != 'Coach'
  		errors.add(:user, message: 'User must be a coach')
  	end
  end
end
