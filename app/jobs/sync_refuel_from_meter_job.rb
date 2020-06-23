# frozen_string_literal: true

class SyncRefuelFromMeterJob < ApplicationJob
  def perform(cars_fuel, car_log)
    SyncRefuelFromMeter.new(cars_fuel).sync(car_log)
  end
end
