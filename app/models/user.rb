# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  first_name :string
#  last_name  :string
#  role_type  :string           not null, indexed => [role_id]
#  role_id    :bigint           not null, indexed => [role_type]
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
	validates :role_type, inclusion: {in: %w[Student Coach]}

	belongs_to :role, polymorphic: true
	has_many :meeting_feedbacks

	scope :coaches, -> { where(role_type: 'Coach') }
	scope :students, -> { where(role_type: 'Student') }
end
