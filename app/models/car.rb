# frozen_string_literal: true
class Car < ApplicationRecord
  has_many :logs, class_name: 'CarLog'
  has_many :refuels, through: :logs

  has_many :cars_fuels
  has_many :fuels, through: :cars_fuels

  validates :name, presence: true
  validates :start_date, presence: true
  validates :start_distance, presence: true
  validates :start_price, presence: true
end
