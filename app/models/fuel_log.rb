# frozen_string_literal: true
class FuelLog < ApplicationRecord
  belongs_to :car

  def consumption
    fuel_used / distance
  end

  def total_price
    fuel_price * fuel_used
  end
end
