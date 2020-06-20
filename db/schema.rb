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

ActiveRecord::Schema.define(version: 2020_06_20_202531) do

  create_table "car_logs", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "time", null: false
    t.decimal "odometer", precision: 7, scale: 1, null: false
    t.decimal "distance", precision: 7, scale: 1, null: false
    t.integer "car_id", null: false
    t.index ["car_id"], name: "index_car_logs_on_car_id"
    t.index ["time"], name: "index_car_logs_on_time"
  end

  create_table "cars", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "start_distance", precision: 10, scale: 3, null: false
    t.decimal "start_price", precision: 10, scale: 3, null: false
    t.date "start_date", null: false
  end

  create_table "cars_fuels", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "car_id", null: false
    t.integer "fuel_id", null: false
    t.index ["car_id"], name: "index_cars_fuels_on_car_id"
    t.index ["fuel_id"], name: "index_cars_fuels_on_fuel_id"
  end

  create_table "fuel_logs", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "time", null: false
    t.decimal "fuel_used", precision: 10, scale: 3, null: false
    t.decimal "fuel_price", precision: 10, scale: 3, null: false
    t.decimal "distance", precision: 10, scale: 3, null: false
    t.integer "car_id", null: false
    t.index ["car_id"], name: "index_fuel_logs_on_car_id"
    t.index ["time"], name: "index_fuel_logs_on_time"
  end

  create_table "fuels", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "unit", null: false
  end

  create_table "odometer_readings", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "time", null: false
    t.decimal "distance", precision: 10, scale: 3, null: false
    t.integer "car_id", null: false
    t.index ["car_id"], name: "index_odometer_readings_on_car_id"
    t.index ["time"], name: "index_odometer_readings_on_time"
  end

  create_table "refuels", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "car_log_id", null: false
    t.integer "fuel_id", null: false
    t.decimal "units_used", precision: 7, scale: 3, null: false
    t.decimal "cost", precision: 5, scale: 2, null: false
    t.index ["car_log_id"], name: "index_refuels_on_car_log_id"
    t.index ["fuel_id"], name: "index_refuels_on_fuel_id"
  end

  create_table "service_logs", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "time", null: false
    t.string "description", null: false
    t.decimal "cost", precision: 10, scale: 3, null: false
    t.decimal "total_distance", precision: 10, scale: 3, null: false
    t.integer "car_id", null: false
    t.index ["car_id"], name: "index_service_logs_on_car_id"
    t.index ["time"], name: "index_service_logs_on_time"
  end

  create_table "users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "user_id", limit: 100, null: false
    t.string "email", default: "", null: false
    t.string "name", default: "", null: false
    t.boolean "active", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_users_on_user_id", unique: true
  end

  add_foreign_key "car_logs", "cars", on_delete: :cascade
  add_foreign_key "cars_fuels", "cars", on_delete: :cascade
  add_foreign_key "cars_fuels", "fuels", on_delete: :cascade
  add_foreign_key "fuel_logs", "cars", on_delete: :cascade
  add_foreign_key "odometer_readings", "cars", on_delete: :cascade
  add_foreign_key "refuels", "car_logs", on_delete: :cascade
  add_foreign_key "refuels", "fuels", on_delete: :cascade
  add_foreign_key "service_logs", "cars", on_delete: :cascade
end
