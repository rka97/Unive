# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171221032117) do

  create_table "course_notes", force: :cascade do |t|
    t.string "title", null: false
    t.string "content", null: false
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_notes_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "code", null: false
    t.string "title", null: false
    t.integer "credit_hours", null: false
    t.integer "total_mark", null: false
    t.integer "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_courses_on_department_id"
  end

  create_table "courseworks", force: :cascade do |t|
    t.date "date_due", null: false
    t.date "date_assigned", null: false
    t.string "description", null: false
    t.float "weight", null: false
    t.integer "total_mark", null: false
    t.string "title", null: false
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_courseworks_on_course_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "abbreviation"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name", null: false
    t.string "position", null: false
    t.date "hiring_date", null: false
    t.integer "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_employees_on_department_id"
  end

  create_table "enrollments", force: :cascade do |t|
    t.string "degree"
    t.integer "student_id"
    t.integer "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_enrollments_on_department_id"
    t.index ["student_id"], name: "index_enrollments_on_student_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.string "friendable_type"
    t.integer "friendable_id"
    t.integer "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "blocker_id"
    t.integer "status"
    t.index ["friendable_type", "friendable_id"], name: "index_friendships_on_friendable_type_and_friendable_id"
  end

  create_table "lectures", force: :cascade do |t|
    t.string "place", null: false
    t.datetime "lec_time", null: false
    t.string "note"
    t.integer "teacher_id"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_lectures_on_course_id"
    t.index ["teacher_id"], name: "index_lectures_on_teacher_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.integer "sender_id"
    t.integer "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_messages_on_receiver_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "student_course_enrollments", force: :cascade do |t|
    t.string "status", null: false
    t.integer "course_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id", "student_id"], name: "index_student_course_enrollments_on_course_id_and_student_id", unique: true
    t.index ["course_id"], name: "index_student_course_enrollments_on_course_id"
    t.index ["student_id"], name: "index_student_course_enrollments_on_student_id"
  end

  create_table "student_courseworks", force: :cascade do |t|
    t.float "mark", null: false
    t.integer "coursework_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date_handed"
    t.string "solution"
    t.index ["coursework_id", "student_id"], name: "index_student_courseworks_on_coursework_id_and_student_id", unique: true
    t.index ["coursework_id"], name: "index_student_courseworks_on_coursework_id"
    t.index ["student_id"], name: "index_student_courseworks_on_student_id"
  end

  create_table "student_teams", force: :cascade do |t|
    t.integer "student_id"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_teams_on_student_id"
    t.index ["team_id"], name: "index_student_teams_on_team_id"
  end

  create_table "students", force: :cascade do |t|
    t.integer "section_number", null: false
    t.integer "bench_number", null: false
    t.string "name", null: false
    t.string "gender", null: false
    t.integer "year", null: false
    t.integer "phone_number", null: false
    t.string "address", null: false
    t.date "birth_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teacher_courses", force: :cascade do |t|
    t.integer "course_id"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date_taught", default: "2017-11-11", null: false
    t.index ["course_id"], name: "index_teacher_courses_on_course_id"
    t.index ["teacher_id"], name: "index_teacher_courses_on_teacher_id"
  end

  create_table "teacher_degrees", force: :cascade do |t|
    t.string "title", null: false
    t.date "date_awarded", null: false
    t.string "university", null: false
    t.string "field", null: false
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_teacher_degrees_on_teacher_id"
  end

  create_table "teacher_interests", force: :cascade do |t|
    t.string "field", null: false
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_teacher_interests_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name", null: false
    t.string "title", null: false
    t.date "hiring_date", null: false
    t.integer "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_teachers_on_department_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
    t.boolean "student", default: true
    t.string "profile_owner_type"
    t.integer "profile_owner_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["profile_owner_type", "profile_owner_id"], name: "index_users_on_profile_owner_type_and_profile_owner_id"
  end

end
