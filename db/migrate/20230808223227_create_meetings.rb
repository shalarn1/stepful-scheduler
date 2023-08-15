class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.references :coach, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
      t.references :time_block, foreign_key: true
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
