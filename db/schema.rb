# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_07_234108) do

  create_table "car_models", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.integer "manufacturer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "motorization"
    t.string "fuel_type"
    t.integer "carcategory_id"
    t.index ["carcategory_id"], name: "index_car_models_on_carcategory_id"
    t.index ["manufacturer_id"], name: "index_car_models_on_manufacturer_id"
  end

  create_table "carcategories", force: :cascade do |t|
    t.string "name"
    t.decimal "daily_rate"
    t.decimal "car_insurance"
    t.decimal "third_part_insurance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cars", force: :cascade do |t|
    t.string "license_plate"
    t.string "color"
    t.integer "car_model_id", null: false
    t.integer "mileage"
    t.integer "subsidiary_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_model_id"], name: "index_cars_on_car_model_id"
    t.index ["subsidiary_id"], name: "index_cars_on_subsidiary_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "document"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rentals", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "customer_id", null: false
    t.integer "carcategory_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "code"
    t.index ["carcategory_id"], name: "index_rentals_on_carcategory_id"
    t.index ["customer_id"], name: "index_rentals_on_customer_id"
  end

  create_table "subsidiaries", force: :cascade do |t|
    t.string "name"
    t.string "cnpj"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "car_models", "carcategories"
  add_foreign_key "car_models", "manufacturers"
  add_foreign_key "cars", "car_models"
  add_foreign_key "cars", "subsidiaries"
  add_foreign_key "rentals", "carcategories"
  add_foreign_key "rentals", "customers"
end
