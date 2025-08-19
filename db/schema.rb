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

ActiveRecord::Schema[8.0].define(version: 2025_08_19_023243) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "charge_types", force: :cascade do |t|
    t.string "name"
    t.decimal "amount"
    t.string "frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "commitments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "week_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_commitments_on_user_id"
    t.index ["week_id"], name: "index_commitments_on_week_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "week_id", null: false
    t.bigint "charge_type_id", null: false
    t.bigint "user_id", null: false
    t.decimal "total_paid"
    t.date "paid_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["charge_type_id"], name: "index_payments_on_charge_type_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
    t.index ["week_id"], name: "index_payments_on_week_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone_number", null: false
    t.boolean "is_admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  create_table "weeks", force: :cascade do |t|
    t.date "date"
    t.string "opponent"
    t.string "lanes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "commitments", "users"
  add_foreign_key "commitments", "weeks"
  add_foreign_key "payments", "charge_types"
  add_foreign_key "payments", "users"
  add_foreign_key "payments", "weeks"
  add_foreign_key "sessions", "users"
end
