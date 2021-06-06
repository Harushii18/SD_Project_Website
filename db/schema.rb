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

ActiveRecord::Schema.define(version: 2021_06_05_231854) do

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

  create_table "blocks", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "BlockStartDate"
    t.date "BlockEndDate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "consultants", primary_key: "ConsultantID", id: { type: :string, limit: 13 }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "ConsultantEmail"
    t.integer "SpecialtyID"
    t.integer "ConsultHospitalID"
    t.string "StudentContactNo", limit: 30, null: false
    t.string "StudentEmail", null: false
    t.index ["ConsultantID"], name: "ConsultantID_UNIQUE", unique: true
    t.index ["StudentContactNo"], name: "StudentContactNo_UNIQUE", unique: true
    t.index ["StudentEmail"], name: "StudentEmail_UNIQUE", unique: true
  end

  create_table "course_specialties", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "Course_id", null: false
    t.bigint "Specialty_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Course_id", "Specialty_id"], name: "index_course_specialties_on_course_id_and_specialty_id", unique: true
    t.index ["Course_id"], name: "index_course_specialties_on_Course_id"
    t.index ["Specialty_id"], name: "index_course_specialties_on_Specialty_id"
  end

  create_table "courses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "CourseDescription"
    t.string "string"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "group_assignments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.integer "StudentID"
    t.integer "GroupYear"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_group_assignments_on_group_id"
  end

  create_table "groups", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "specialty_id", null: false
    t.bigint "block_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["block_id"], name: "index_groups_on_block_id"
    t.index ["specialty_id"], name: "index_groups_on_specialty_id"
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

  create_table "hospital_availabilities", primary_key: ["HospSpecialtyID", "AvailableHospitalID"], charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "HospSpecialtyID", null: false
    t.integer "AvailableHospitalID", null: false
    t.integer "NumStudents"
    t.index ["HospSpecialtyID"], name: "SpecialtyID_UNIQUE", unique: true
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
    t.integer "ProgrammeID"
    t.integer "CourseID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "registrar_assignments", primary_key: "BlockID", id: :integer, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "RegistrarID", limit: 13, null: false
    t.integer "HospitalID", null: false
    t.index ["BlockID"], name: "BlockID_UNIQUE", unique: true
    t.index ["RegistrarID"], name: "RegistrarID_UNIQUE", unique: true
  end

  create_table "registrars", primary_key: "RegistrarID", id: { type: :string, limit: 13 }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "RegistrarEmail"
    t.integer "SpecialtyID", null: false
    t.index ["RegistrarEmail"], name: "RegistrarEmail_idx"
    t.index ["RegistrarID"], name: "RegistrarID_UNIQUE", unique: true
  end

  create_table "rotations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "startDate"
    t.date "endDate"
    t.integer "programme_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedules", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "student_id"
    t.integer "specialty_id"
    t.integer "rotation_id"
    t.integer "hospital_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "specialties", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "SpecialtyName"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "specialty_pages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "specialty_ID"
    t.string "specialty_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "students", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "studentNumber"
    t.string "courseCodes"
    t.integer "programme_id"
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

  add_foreign_key "course_specialties", "courses", column: "Course_id"
  add_foreign_key "course_specialties", "specialties", column: "Specialty_id"
  add_foreign_key "group_assignments", "groups"
  add_foreign_key "groups", "blocks"
  add_foreign_key "groups", "specialties"
  add_foreign_key "hospital_assignments", "blocks"
  add_foreign_key "hospital_assignments", "hospitals"
  add_foreign_key "hospital_assignments", "users"
  add_foreign_key "programme_courses", "courses"
  add_foreign_key "programme_courses", "programmes"
  add_foreign_key "registrar_assignments", "registrars", column: "RegistrarID", primary_key: "RegistrarID", name: "RegistrarID"
end
