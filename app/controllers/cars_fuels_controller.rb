# frozen_string_literal: true

class CarsFuelsController < ApplicationController
  def create
    CarsFuel.create(cars_fuels_params)

    redirect_to edit_car_path(params[:car_id])
  end

  def destroy
    CarsFuel.find(params[:id]).destroy

    redirect_to edit_car_path(params[:car_id])
  end

  private

  def cars_fuels_params
    {
      car_id: params.require(:car_id),
      fuel_id: params.require(:fuel_id)
    }
  end
end
