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

ActiveRecord::Schema.define(version: 20171215224412) do

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

  create_table "teachers", force: :cascade do |t|
    t.string "name", null: false
    t.string "title", null: false
    t.date "hiring_date", null: false
    t.integer "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_teachers_on_department_id"
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
