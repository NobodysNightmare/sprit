# frozen_string_literal: true

class CreateFuels < ActiveRecord::Migration[5.0]
  def change
    create_table :fuels do |t|
      t.string :name, null: false
      t.string :unit, null: false
    end
  end
end
