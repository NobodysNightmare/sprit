# frozen_string_literal: true

class CarsFuelsController < ApplicationController
  def create
    CarsFuel.create(create_params)

    redirect_to edit_car_path(params[:car_id])
  end

  def update
    CarsFuel.find(params[:id]).update(update_params)

    redirect_to edit_car_path(params[:car_id])
  end

  def destroy
    CarsFuel.find(params[:id]).destroy

    redirect_to edit_car_path(params[:car_id])
  end

  private

  def create_params
    {
      car_id: params.require(:car_id),
      fuel_id: params.require(:fuel_id)
    }
  end

  def update_params
    params.require(:cars_fuel).permit(:meter_serial)
  end
end
