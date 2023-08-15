# == Schema Information
#
# Table name: coaches
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Coach < ApplicationRecord
	has_one :user, as: :role, inverse_of: :role, dependent: :destroy
	has_many :time_blocks
	has_many :meetings
end
