# frozen_string_literal: true

class Refuel < ApplicationRecord
  belongs_to :car_log
  belongs_to :fuel

  delegate :unit, to: :fuel
end
