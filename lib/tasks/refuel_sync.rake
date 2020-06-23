# frozen_string_literal: true

namespace :refuel_sync do
  desc 'Sync automated energy readings for all logs'
  task sync_all: :environment do
    CarsFuel.where.not(meter_serial: nil).each do |cf|
      sync_service = SyncRefuelFromMeter.new(cf)
      puts
      puts "## #{cf.car.name} - #{cf.fuel.name}"

      cf.car.logs.order(:time).each do |log|
        puts log.time
        sync_service.sync(log)
      end
    end
  end

  desc 'Sync automated energy readings for logs with missing refuels'
  task sync_missing: :environment do
    CarsFuel.where.not(meter_serial: nil).each do |cf|
      sync_service = SyncRefuelFromMeter.new(cf)
      puts
      puts "## #{cf.car.name} - #{cf.fuel.name}"

      cf.car.logs.joins("LEFT JOIN refuels ON refuels.car_log_id = car_logs.id AND refuels.fuel_id = #{cf.fuel_id}")
                 .where(refuels: { fuel_id: nil })
                 .order(:time)
                 .each do |log|
        puts log.time
        sync_service.sync(log)
      end
    end
  end
end
