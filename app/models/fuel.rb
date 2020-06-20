# frozen_string_literal: true

class Fuel < ApplicationRecord
  validates :name, presence: true
  validates :unit, presence: true
end
