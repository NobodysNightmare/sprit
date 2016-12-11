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

ActiveRecord::Schema.define(version: 20161211172022) do

  create_table "cars", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "name",                                    null: false
    t.decimal "start_distance", precision: 10, scale: 3, null: false
    t.decimal "start_price",    precision: 10, scale: 3, null: false
    t.date    "start_date",                              null: false
  end

  create_table "fuel_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time",                                null: false
    t.decimal  "fuel_used",  precision: 10, scale: 3, null: false
    t.decimal  "fuel_price", precision: 10, scale: 3, null: false
    t.decimal  "distance",   precision: 10, scale: 3, null: false
    t.integer  "car_id",                              null: false
    t.index ["car_id"], name: "index_fuel_logs_on_car_id", using: :btree
    t.index ["time"], name: "index_fuel_logs_on_time", using: :btree
  end

  create_table "service_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time",                                    null: false
    t.string   "description",                             null: false
    t.decimal  "cost",           precision: 10, scale: 3, null: false
    t.decimal  "total_distance", precision: 10, scale: 3, null: false
    t.integer  "car_id",                                  null: false
    t.index ["car_id"], name: "index_service_logs_on_car_id", using: :btree
    t.index ["time"], name: "index_service_logs_on_time", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "user_id",    limit: 100,                 null: false
    t.string   "email",                  default: "",    null: false
    t.string   "name",                   default: "",    null: false
    t.boolean  "active",                 default: false, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["user_id"], name: "index_users_on_user_id", unique: true, using: :btree
  end

  add_foreign_key "fuel_logs", "cars", on_delete: :cascade
  add_foreign_key "service_logs", "cars", on_delete: :cascade
end
