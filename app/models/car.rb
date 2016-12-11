# frozen_string_literal: true
class Car < ApplicationRecord
  has_many :fuel_logs
  has_many :service_logs
end
