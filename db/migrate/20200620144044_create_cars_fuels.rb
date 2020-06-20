# frozen_string_literal: true

class CreateCarsFuels < ActiveRecord::Migration[5.0]
  def change
    create_table :cars_fuels do |t|
      t.references :car, null: false, foreign_key: { on_delete: :cascade }
      t.references :fuel, null: false, foreign_key: { on_delete: :cascade }
    end
  end
end
