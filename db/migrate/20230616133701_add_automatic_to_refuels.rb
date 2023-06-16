# frozen_string_literal: true

class AddAutomaticToRefuels < ActiveRecord::Migration[7.0]
  def change
    add_column :refuels, :automatic, :boolean, null: false, default: false
  end
end
