# frozen_string_literal: true

class CreateCarLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :car_logs do |t|
      t.datetime :time, null: false, index: true
      t.decimal :odometer, null: false, precision: 7, scale: 1

      # Distance is a shortcut for self.odometer - previous.odometer
      t.decimal :distance, null: false, precision: 7, scale: 1

      t.references :car, null: false, foreign_key: { on_delete: :cascade }
    end
  end
end
