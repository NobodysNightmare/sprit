class CarSummary
  attr_reader :car

  def initialize(car)
    @car = car
  end

  def logged_distance
    @logged_distance ||= @car.logs.sum(:distance)
  end

  def logged_consumptions
    @logged_consumptions ||= @car.refuels.group(:fuel).sum(:units_used)
  end

  def logged_costs
    @logged_costs ||= begin
      costs = @car.refuels.group(:fuel).sum(:cost).transform_keys do |fuel|
        fuel.name
      end
      costs['Total'] = costs.values.sum if costs.size > 1
      costs
    end
  end

  def logging_duration
    @logging_duration ||= begin
      logs = @car.logs.order(:time)
      logs.last.time.to_date - logs.first.time.to_date
    end
  end

  def consumptions_per_km
    logged_consumptions.transform_values do |consumption|
      consumption / logged_distance
    end
  end

  def costs_per_km
    logged_costs.transform_values do |cost|
      cost / logged_distance
    end
  end

  def consumptions_per_day
    logged_consumptions.transform_values do |consumption|
      consumption / logging_duration
    end
  end

  def costs_per_day
    logged_costs.transform_values do |cost|
      cost / logging_duration
    end
  end

  def distance_per_day
    logged_distance / logging_duration
  end
end
