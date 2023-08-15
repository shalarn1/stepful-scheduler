# == Schema Information
#
# Table name: time_blocks
#
#  id         :bigint           not null, primary key
#  coach_id   :bigint           indexed, indexed => [start_at, end_at]
#  end_at     :datetime         not null, indexed => [coach_id, start_at], indexed
#  start_at   :datetime         not null, indexed => [coach_id, end_at], indexed
#  status     :integer          default("free"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TimeBlock < ApplicationRecord
  validates :start_at, :end_at, presence: true
  validates :coach, uniqueness: {scope: %i[start_at end_at]}
  validate :validate_date_range

  belongs_to :coach
  has_one :meeting

  enum status: %i[free booked]

  def date_pretty
    start_at.strftime('%a, %B %-d, %Y')
  end

  def start_time_pretty
    start_at.strftime('%I:%M %p')
  end

  def end_time_pretty
    end_at.strftime('%I:%M %p')
  end

  def js_args
    {
      id: id,
      coach_id: coach_id,
      meeting_id: meeting&.id,
      free: free?,
      date: date_pretty,
      start_time: start_time_pretty,
      end_time: end_time_pretty
    }
  end

  def validate_date_range
    if coach_id_changed? || start_at_changed? || end_at_changed?
      # Date ranges overlap if start_at_1 <= end_at_2 && end_at_1 >= start_at_2
      overlapping_blocks = TimeBlock.where(coach_id: coach_id, start_at: ..end_at, end_at: start_at..)
      if overlapping_blocks.exists?
        errors.add(:coach, message: 'Coach already has a time block in that time range')
      end
    end
  end
end
