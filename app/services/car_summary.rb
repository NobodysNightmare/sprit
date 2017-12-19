class CarSummary
  attr_reader :car

  def initialize(car)
    @car = car
  end

  def logged_distance
    @logged_distance ||= @car.fuel_logs.sum(:distance)
  end

  def logged_consumption
    @logged_consumption ||= @car.fuel_logs.sum(:fuel_used)
  end

  def logged_cost
    @logged_cost ||= @car.fuel_logs.sum('fuel_used * fuel_price')
  end

  def logging_duration
    @logging_duration ||= begin
      logs = @car.fuel_logs.order(:time)
      logs.last.time.to_date - logs.first.time.to_date
    end
  end

  def consumption_per_km
    logged_consumption / logged_distance
  end

  def cost_per_km
    logged_cost / logged_distance
  end

  def consumption_per_day
    logged_consumption / logging_duration
  end

  def cost_per_day
    logged_cost / logging_duration
  end

  def distance_per_day
    logged_distance / logging_duration
  end
end
