# frozen_string_literal: true

class CarsFuel < ApplicationRecord
  belongs_to :car
  belongs_to :fuel
end
