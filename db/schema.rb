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

ActiveRecord::Schema[7.0].define(version: 2020_06_22_223111) do
  create_table "car_logs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.datetime "time", precision: nil, null: false
    t.decimal "odometer", precision: 7, scale: 1, null: false
    t.decimal "distance", precision: 7, scale: 1, null: false
    t.integer "car_id", null: false
    t.index ["car_id"], name: "index_car_logs_on_car_id"
    t.index ["time"], name: "index_car_logs_on_time"
  end

  create_table "cars", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "start_distance", precision: 10, scale: 3, null: false
    t.decimal "start_price", precision: 10, scale: 3, null: false
    t.date "start_date", null: false
  end

  create_table "cars_fuels", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "car_id", null: false
    t.integer "fuel_id", null: false
    t.string "meter_serial"
    t.index ["car_id"], name: "index_cars_fuels_on_car_id"
    t.index ["fuel_id"], name: "index_cars_fuels_on_fuel_id"
  end

  create_table "fuel_logs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.datetime "time", precision: nil, null: false
    t.decimal "fuel_used", precision: 10, scale: 3, null: false
    t.decimal "fuel_price", precision: 10, scale: 3, null: false
    t.decimal "distance", precision: 10, scale: 3, null: false
    t.integer "car_id", null: false
    t.index ["car_id"], name: "index_fuel_logs_on_car_id"
    t.index ["time"], name: "index_fuel_logs_on_time"
  end

  create_table "fuels", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "unit", null: false
  end

  create_table "refuels", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "car_log_id", null: false
    t.integer "fuel_id", null: false
    t.decimal "units_used", precision: 7, scale: 3, null: false
    t.decimal "cost", precision: 5, scale: 2, null: false
    t.index ["car_log_id"], name: "index_refuels_on_car_log_id"
    t.index ["fuel_id"], name: "index_refuels_on_fuel_id"
  end

  create_table "service_logs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.datetime "time", precision: nil, null: false
    t.string "description", null: false
    t.decimal "cost", precision: 10, scale: 3, null: false
    t.decimal "total_distance", precision: 10, scale: 3, null: false
    t.integer "car_id", null: false
    t.index ["car_id"], name: "index_service_logs_on_car_id"
    t.index ["time"], name: "index_service_logs_on_time"
  end

  create_table "users", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "user_id", limit: 100, null: false
    t.string "email", default: "", null: false
    t.string "name", default: "", null: false
    t.boolean "active", default: false, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id"], name: "index_users_on_user_id", unique: true
  end

  add_foreign_key "car_logs", "cars", on_delete: :cascade
  add_foreign_key "cars_fuels", "cars", on_delete: :cascade
  add_foreign_key "cars_fuels", "fuels", on_delete: :cascade
  add_foreign_key "fuel_logs", "cars", on_delete: :cascade
  add_foreign_key "refuels", "car_logs", on_delete: :cascade
  add_foreign_key "refuels", "fuels", on_delete: :cascade
  add_foreign_key "service_logs", "cars", on_delete: :cascade
end
