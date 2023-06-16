# frozen_string_literal: true
class RefuelsController < ApplicationController
  HTML_DATETIME_LOCAL = '%Y-%m-%dT%H:%M:00'

  def new
    @refuel = Refuel.new(car_log_id: params[:car_log_id], fuel_id: params[:fuel_id])

    render :edit
  end

  def edit
    @refuel = Refuel.find(params[:id])
  end

  def create
    refuel = Refuel.create(refuel_params)
    if refuel.persisted?
      flash[:success] = I18n.t('flashs.created_model',
                               model: Refuel.model_name.human)
    else
      helpers.flash_errors(refuel.errors)
    end

    redirect_to car_log_path(refuel.car_log_id)
  end

  def update
    refuel = Refuel.find(params[:id])
    if refuel.update(refuel_params)
      flash[:success] = I18n.t('flashs.updated_model',
                               model: Refuel.model_name.human)
    else
      helpers.flash_errors(refuel.errors)
    end

    redirect_to car_log_path(refuel.car_log_id)
  end

  def destroy
    refuel = Refuel.find(params[:id])
    refuel.destroy
    flash[:success] = I18n.t('flashs.destroyed_model',
                             model: Refuel.model_name.human)
    redirect_to car_log_path(refuel.car_log_id)
  end

  private

  def refuel_params
    params.require(:refuel).permit(:car_log_id, :fuel_id, :cost, :units_used)
  end
end
