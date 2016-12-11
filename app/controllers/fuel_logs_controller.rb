# frozen_string_literal: true
class FuelLogsController < ApplicationController
  HTML_DATETIME_LOCAL = '%Y-%m-%dT%H:%M:%S'

  def new
    @default_time = Time.now.strftime(HTML_DATETIME_LOCAL)
  end

  def index
    @logs = FuelLog.order(time: :desc).page(params[:page])
  end

  def create
    log = FuelLog.create(fuel_log_params)
    if log.persisted?
      flash[:success] = I18n.t('flashs.created_model',
                               model: FuelLog.model_name.human)
    else
      helpers.flash_errors(log.errors)
    end
    redirect_to action: :new
  end

  private

  def fuel_log_params
    params.require(:fuel_log).permit(:car_id, :time, :distance, :fuel_price, :fuel_used)
  end
end
