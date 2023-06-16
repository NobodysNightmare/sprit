# frozen_string_literal: true

class InitAutomaticOnRefuels < ActiveRecord::Migration[7.0]
  def change
    Refuel.includes(:fuel).each do |refuel|
      refuel.update!(automatic: refuel.fuel.unit == 'kWh')
    end
  end
end
