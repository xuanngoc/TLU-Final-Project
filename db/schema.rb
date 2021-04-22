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

ActiveRecord::Schema.define(version: 2021_04_22_114959) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "business_trip_costs", force: :cascade do |t|
    t.bigint "cost_type_id"
    t.bigint "request_payment_id"
    t.integer "receipt_id"
    t.string "receipt_type"
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cost_type_id"], name: "index_business_trip_costs_on_cost_type_id"
    t.index ["request_payment_id"], name: "index_business_trip_costs_on_request_payment_id"
  end

  create_table "business_trip_users", force: :cascade do |t|
    t.bigint "business_trip_id"
    t.bigint "user_id"
    t.index ["business_trip_id"], name: "index_business_trip_users_on_business_trip_id"
    t.index ["user_id"], name: "index_business_trip_users_on_user_id"
  end

  create_table "business_trips", force: :cascade do |t|
    t.string "destination"
    t.text "purpose"
    t.date "from_date"
    t.date "to_date"
    t.string "decision_writing"
    t.string "status"
  end

  create_table "cost_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "degree_levels", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "department_id"
    t.index ["department_id"], name: "index_degree_levels_on_department_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.string "code"
  end

  create_table "e_receipts", force: :cascade do |t|
    t.string "tax_number"
    t.string "template_number"
    t.string "symbols"
    t.string "receipt_number"
    t.string "amount"
    t.bigint "business_trip_cost_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["business_trip_cost_id"], name: "index_e_receipts_on_business_trip_cost_id"
  end

  create_table "limit_costs", force: :cascade do |t|
    t.bigint "degree_level_id"
    t.bigint "cost_type_id"
    t.integer "limit"
    t.index ["cost_type_id"], name: "index_limit_costs_on_cost_type_id"
    t.index ["degree_level_id"], name: "index_limit_costs_on_degree_level_id"
  end

  create_table "no_receipts", force: :cascade do |t|
    t.bigint "business_trip_cost_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "amount"
    t.index ["business_trip_cost_id"], name: "index_no_receipts_on_business_trip_cost_id"
  end

  create_table "reason_rejects", force: :cascade do |t|
    t.bigint "request_payment_id"
    t.text "reason"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["request_payment_id"], name: "index_reason_rejects_on_request_payment_id"
  end

  create_table "request_payments", force: :cascade do |t|
    t.bigint "business_trip_id"
    t.integer "total_amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
    t.bigint "user_id"
    t.index ["business_trip_id"], name: "index_request_payments_on_business_trip_id"
    t.index ["user_id"], name: "index_request_payments_on_user_id"
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
    t.string "full_name"
    t.boolean "gender"
    t.string "address"
    t.date "birthday"
    t.bigint "degree_level_id"
    t.string "code"
    t.index ["degree_level_id"], name: "index_users_on_degree_level_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "request_payments", "users"
end
