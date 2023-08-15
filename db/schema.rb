# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_09_001153) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coaches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meeting_feedbacks", force: :cascade do |t|
    t.bigint "meeting_id"
    t.bigint "user_id"
    t.integer "score"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meeting_id"], name: "index_meeting_feedbacks_on_meeting_id"
    t.index ["user_id"], name: "index_meeting_feedbacks_on_user_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.bigint "coach_id"
    t.bigint "student_id"
    t.bigint "time_block_id"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id"], name: "index_meetings_on_coach_id"
    t.index ["student_id"], name: "index_meetings_on_student_id"
    t.index ["time_block_id"], name: "index_meetings_on_time_block_id"
  end

  create_table "students", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_blocks", force: :cascade do |t|
    t.bigint "coach_id"
    t.integer "status", default: 0, null: false
    t.datetime "start_at", null: false
    t.datetime "end_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id", "start_at", "end_at"], name: "index_time_blocks_on_coach_id_start_at_and_end_at"
    t.index ["coach_id"], name: "index_time_blocks_on_coach_id"
    t.index ["end_at"], name: "index_time_blocks_on_end_at"
    t.index ["start_at"], name: "index_time_blocks_on_start_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "role_type", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_type", "role_id"], name: "index_users_on_role", unique: true
  end

  add_foreign_key "meeting_feedbacks", "meetings"
  add_foreign_key "meeting_feedbacks", "users"
  add_foreign_key "meetings", "coaches"
  add_foreign_key "meetings", "students"
  add_foreign_key "meetings", "time_blocks"
  add_foreign_key "time_blocks", "coaches"
end
