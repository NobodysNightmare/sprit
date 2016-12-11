# frozen_string_literal: true
class CreateFuelLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :fuel_logs do |t|
      t.datetime :time, null: false, index: true
      t.decimal :fuel_used, null: false, precision: 10, scale: 3
      t.decimal :fuel_price, null: false, precision: 10, scale: 3
      t.decimal :distance, null: false, precision: 10, scale: 3
      t.references :car, null: false, foreign_key: { on_delete: :cascade }
    end
  end
end
