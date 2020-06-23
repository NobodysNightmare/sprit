# frozen_string_literal: true

class Fuel < ApplicationRecord
  validates :name, presence: true
  validates :unit, presence: true

  # Whether or not this application is able to pull statistics about this fuel
  # from an automated meter.
  def meterable?
    unit == 'kWh'
  end
end
