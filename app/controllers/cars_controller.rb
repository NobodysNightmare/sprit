# frozen_string_literal: true
class CarsController < ApplicationController
  def new
    @car = Car.new
    render :edit
  end

  def edit
    @car = Car.find(params[:id])
  end

  def index
    @cars = Car.order(:start_date)
  end

  def create
    car = Car.create(car_params)
    if car.persisted?
      flash[:success] = I18n.t('flashs.created_model',
                               model: Car.model_name.human)
    else
      helpers.flash_errors(car.errors)
    end
    redirect_to action: :index
  end

  def update
    car = Car.find(params[:id])
    if car.update(inverter_params)
      flash[:success] = I18n.t('flashs.updated_model',
                               model: Car.model_name.human)
    else
      helpers.flash_errors(car.errors)
    end

    redirect_to action: :index
  end

  def destroy
    Car.find(params[:id]).destroy
    flash[:success] = I18n.t('flashs.destroyed_model',
                             model: Car.model_name.human)
    redirect_to action: :index
  end

  def summary
    car = Car.includes(:fuel_logs).find(params[:id])
    @statistics = CarSummary.new(car)
  end

  private

  def car_params
    params.require(:car).permit(:name, :start_date, :start_price, :start_distance)
  end
end
