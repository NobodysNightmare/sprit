# frozen_string_literal: true

class MigrateFromFuelLogs < ActiveRecord::Migration[5.0]
  def up
    ActiveRecord::Base.transaction do
      fuel = Fuel.create!(name: 'Benzin', unit: 'L')
      Car.all.each do |car|
        car.fuels << fuel
        odo = car.start_distance
        car.fuel_logs.order(:time).each do |fl|
          odo += fl.distance
          log = car.logs.create!(time: fl.time, odometer: odo, distance: fl.distance)
          log.refuels.create!(fuel: fuel, units_used: fl.fuel_used, cost: fl.fuel_used * fl.fuel_price)
        end
      end
    end
  end

  def down
    ActiveRecord::Base.transaction do
      Fuel.delete_all
      Refuel.delete_all
      CarLog.delete_all
    end
  end
end
