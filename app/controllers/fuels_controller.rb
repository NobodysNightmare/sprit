# frozen_string_literal: true
class FuelsController < ApplicationController
  def new
    @fuel = Fuel.new
    render :edit
  end

  def edit
    @fuel = Fuel.find(params[:id])
  end

  def index
    @fuels = Fuel.order(:name)
  end

  def create
    fuel = Fuel.create(fuel_params)
    if fuel.persisted?
      flash[:success] = I18n.t('flashs.created_model',
                               model: Fuel.model_name.human)
    else
      helpers.flash_errors(fuel.errors)
    end
    redirect_to action: :index
  end

  def update
    fuel = Fuel.find(params[:id])
    if fuel.update(fuel_params)
      flash[:success] = I18n.t('flashs.updated_model',
                               model: Fuel.model_name.human)
    else
      helpers.flash_errors(fuel.errors)
    end

    redirect_to action: :index
  end

  def destroy
    Fuel.find(params[:id]).destroy
    flash[:success] = I18n.t('flashs.destroyed_model',
                             model: Fuel.model_name.human)
    redirect_to action: :index
  end

  private

  def fuel_params
    params.require(:fuel).permit(:name, :unit)
  end
end
