# == Schema Information
#
# Table name: students
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Student < ApplicationRecord
	has_one :user, as: :role, inverse_of: :role, dependent: :destroy
	has_many :meetings
end
