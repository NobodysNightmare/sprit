# frozen_string_literal: true

class CarLog < ApplicationRecord
  belongs_to :car
  has_many :refuels

  accepts_nested_attributes_for :refuels
end
