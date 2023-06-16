# frozen_string_literal: true

class DropOldTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :fuel_logs
    drop_table :service_logs
  end
end
