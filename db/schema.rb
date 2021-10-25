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

ActiveRecord::Schema.define(version: 2021_10_08_190452) do

  create_table "admins", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "allocations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "hospital_id"
    t.integer "specialty_id"
    t.integer "available_slots"
    t.integer "used_slots"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "blocks", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "BlockStartDate"
    t.date "BlockEndDate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "course_specialties", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "specialty_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "weeks"
    t.index ["course_id", "specialty_id"], name: "index_course_specialties_on_course_id_and_specialty_id", unique: true
    t.index ["course_id"], name: "index_course_specialties_on_course_id"
    t.index ["specialty_id"], name: "index_course_specialties_on_specialty_id"
  end

  create_table "courses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "CourseDescription"
    t.string "string"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "groups", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "programme_id", null: false
    t.string "group_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["programme_id"], name: "index_groups_on_programme_id"
  end

  create_table "hospital_assignments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "block_id", null: false
    t.bigint "hospital_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["block_id"], name: "index_hospital_assignments_on_block_id"
    t.index ["hospital_id"], name: "index_hospital_assignments_on_hospital_id"
    t.index ["user_id"], name: "index_hospital_assignments_on_user_id"
  end

  create_table "hospitals", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "hospital_name"
    t.string "hospital_location"
    t.string "hospital_contactNo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "programme_courses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "ProgrammeID"
    t.integer "CourseID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "programme_id"
    t.bigint "course_id"
    t.index ["course_id"], name: "index_programme_courses_on_course_id"
    t.index ["programme_id"], name: "index_programme_courses_on_programme_id"
  end

  create_table "programmes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "programme_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rotations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "startDate"
    t.date "endDate"
    t.integer "programme_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedules", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "specialty_id", null: false
    t.bigint "hospital_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "week_no"
    t.string "specialty_duration"
    t.index ["hospital_id"], name: "index_schedules_on_hospital_id"
    t.index ["specialty_id"], name: "index_schedules_on_specialty_id"
    t.index ["student_id"], name: "index_schedules_on_student_id"
  end

  create_table "site_facilitator_allocations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "hospital_id"
    t.integer "site_facilitator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "site_facilitators", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "Site_Facilitator_Name"
    t.string "Site_Facilitator_ContactNo"
    t.string "Site_Facilitator_Email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "specialties", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "SpecialtyName"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "student_groups", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_student_groups_on_group_id"
    t.index ["student_id"], name: "index_student_groups_on_student_id"
  end

  create_table "students", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "studentNumber"
    t.string "courseCodes"
    t.integer "programme_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email"
    t.string "user_FirstName"
    t.string "user_LastName"
    t.string "password_digest"
    t.string "user_ContactNo"
    t.string "user_Type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "course_specialties", "courses"
  add_foreign_key "course_specialties", "specialties"
  add_foreign_key "groups", "programmes"
  add_foreign_key "hospital_assignments", "blocks"
  add_foreign_key "hospital_assignments", "hospitals"
  add_foreign_key "hospital_assignments", "users"
  add_foreign_key "programme_courses", "courses"
  add_foreign_key "programme_courses", "programmes"
  add_foreign_key "schedules", "hospitals"
  add_foreign_key "schedules", "specialties"
  add_foreign_key "schedules", "students"
  add_foreign_key "student_groups", "groups"
  add_foreign_key "student_groups", "students"
end
