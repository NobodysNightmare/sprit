# frozen_string_literal: true

class CarsFuel < ApplicationRecord
  belongs_to :car
  belongs_to :fuel

  scope :manual_metering, ->() { where(meter_serial: [nil, '']) }
  scope :automatic_metering, ->() { where.not(meter_serial: [nil, '']) }
end
