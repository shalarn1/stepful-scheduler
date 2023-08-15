class CreateMeetingFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :meeting_feedbacks do |t|
      t.references :meeting, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :score
      t.text :notes

      t.timestamps
    end
  end
end
