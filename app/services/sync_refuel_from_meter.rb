# frozen_string_literal: true

class SyncRefuelFromMeter
  def initialize(cars_fuel)
    @car = cars_fuel.car
    @fuel = cars_fuel.fuel
    @meter_serial = cars_fuel.meter_serial

    validate_instance!
  end

  def sync(car_log)
    validate_log!(car_log)

    result = MeterFetcher.usage_between(@meter_serial, from: previous_time(car_log), to: car_log.time)
    refuel = car_log.refuels.find_or_initialize_by(fuel_id: @fuel.id)
    refuel.update!(units_used: Rational(result.energy, 1000), cost: result.cost)
  end

  private

  def previous_time(car_log)
    previous_log = @car.logs.order(:time).where('time < ?', car_log.time).last

    return previous_log.time if previous_log

    @car.start_date.beginning_of_day
  end

  def validate_instance!
    raise ArgumentError, "Couldn't determine serial number of meter to read from." unless @meter_serial

    return if @fuel.meterable?

    raise ArgumentError, "Passed #{fuel.name} as a fuel, which is not meterable."
  end

  def validate_log!(car_log)
    return if car_log.car == @car

    raise ArgumentError, "CarLog provided belongs to #{car_log.car.name}, expected log for #{@car.name}."
  end
end
