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

ActiveRecord::Schema.define(version: 2021_04_04_145109) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "business_trips", force: :cascade do |t|
    t.bigint "teacher_id"
    t.string "destination"
    t.date "from_date"
    t.date "to_date"
    t.integer "purpose"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["teacher_id"], name: "index_business_trips_on_teacher_id"
  end

  create_table "costs", force: :cascade do |t|
    t.string "type"
    t.string "amount"
    t.bigint "business_trips_id"
    t.datetime "at"
    t.index ["business_trips_id"], name: "index_costs_on_business_trips_id"
  end

  create_table "degree_employees", force: :cascade do |t|
    t.string "type"
    t.string "name"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.bigint "teacher_id"
    t.index ["teacher_id"], name: "index_departments_on_teacher_id"
  end

  create_table "limit_costs", force: :cascade do |t|
    t.bigint "degree_employees_id"
    t.integer "limit"
    t.integer "cost_type"
    t.index ["degree_employees_id"], name: "index_limit_costs_on_degree_employees_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "full_name"
    t.string "address"
    t.boolean "gender"
    t.date "birthday"
    t.integer "academic_levels"
    t.bigint "user_id"
    t.bigint "department_id"
    t.string "code"
    t.index ["department_id"], name: "index_teachers_on_department_id"
    t.index ["user_id"], name: "index_teachers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role"
    t.bigint "teacher_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["teacher_id"], name: "index_users_on_teacher_id"
  end

end
