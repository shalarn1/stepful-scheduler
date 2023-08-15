class CreateTimeBlocks < ActiveRecord::Migration[7.0]
  def change
    create_table :time_blocks do |t|
      t.references :coach, index: true, foreign_key: true
      t.integer :status, null: false, default: 0
      t.datetime :start_at, index: true, null: false
      t.datetime :end_at, index: true, null: false

      t.index %i[coach_id start_at end_at], name: :index_time_blocks_on_coach_id_start_at_and_end_at

      t.timestamps
    end
  end
end
