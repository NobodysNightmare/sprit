# frozen_string_literal: true

class CreateRefuels < ActiveRecord::Migration[5.0]
  def change
    create_table :refuels do |t|
      t.references :car_log, null: false, foreign_key: { on_delete: :cascade }
      t.references :fuel, null: false, foreign_key: { on_delete: :cascade }

      t.decimal :units_used, null: false, precision: 7, scale: 3
      t.decimal :cost, null: false, precision: 5, scale: 2
    end
  end
end
