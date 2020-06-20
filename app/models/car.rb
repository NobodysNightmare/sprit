# frozen_string_literal: true
class Car < ApplicationRecord
  has_many :fuel_logs
  has_many :service_logs
  
  has_many :logs, class_name: 'CarLog'
  has_many :refuels, through: :logs

  has_many :cars_fuels
  has_many :fuels, through: :cars_fuels
end
