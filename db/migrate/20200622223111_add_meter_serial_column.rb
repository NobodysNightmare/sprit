# frozen_string_literal: true

class AddMeterSerialColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :cars_fuels, :meter_serial, :string, null: true
  end
end
