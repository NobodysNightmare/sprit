# frozen_string_literal: true
class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :name, null: false
      t.decimal :start_distance, null: false
      t.decimal :start_price, null: false
      t.date :start_date, null: false
    end
  end
end
