# frozen_string_literal: true
class CreateServiceLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :service_logs do |t|
      t.datetime :time, null: false, index: true
      t.string :description, null: false
      t.decimal :cost, null: false, precision: 10, scale: 3
      t.decimal :total_distance, null: false, precision: 10, scale: 3
      t.references :car, null: false, foreign_key: { on_delete: :cascade }
    end
  end
end
