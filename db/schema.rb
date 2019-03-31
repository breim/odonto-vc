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

ActiveRecord::Schema.define(version: 2019_03_30_180621) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consultations", force: :cascade do |t|
    t.date "date"
    t.string "hour"
    t.string "duration"
    t.text "annotation"
    t.boolean "deleted", default: false
    t.bigint "user_id"
    t.bigint "customer_id"
    t.boolean "canceled", default: false
    t.boolean "sms_sent", default: false
    t.date "sms_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_consultations_on_customer_id"
    t.index ["user_id"], name: "index_consultations_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.date "birthday"
    t.string "gender"
    t.string "code"
    t.string "email"
    t.string "celphone"
    t.string "phone"
    t.string "zipcode"
    t.string "address"
    t.string "number"
    t.string "distric"
    t.string "state"
    t.string "city"
    t.string "complement"
    t.string "cpf"
    t.string "annotation"
    t.bigint "user_id"
    t.boolean "deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "token"
    t.boolean "disabled", default: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "consultations", "customers"
  add_foreign_key "consultations", "users"
  add_foreign_key "customers", "users"
end
