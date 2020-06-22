# frozen_string_literal: true
class CarLogsController < ApplicationController
  HTML_DATETIME_LOCAL = '%Y-%m-%dT%H:%M:00'

  def new
    @default_time = Time.zone.now.strftime(HTML_DATETIME_LOCAL)
    car = Car.last
    @log = car.logs.build
    car.fuels.each do |fuel|
      @log.refuels.build(fuel: fuel)
    end
  end

  def index
    @logs = CarLog.order(time: :desc).includes(refuels: :fuel).page(params[:page])
  end

  def create
    log = CarLog.new(car_log_params)
    fill_distance!(log)
    log.save

    if log.persisted?
      flash[:success] = I18n.t('flashs.created_model',
                               model: CarLog.model_name.human)
    else
      helpers.flash_errors(log.errors)
    end
    redirect_to action: :new
  end

  private

  def car_log_params
    params.require(:car_log).permit(:car_id, :time, :odometer, refuels_attributes: [:cost, :units_used, :fuel_id])
  end

  def fill_distance!(log)
    previous = log.car.logs.order(:time).where('time < ?', log.time).last
    previous_odo = previous ? previous.odometer : log.car.start_distance
    log.distance = log.odometer - previous_odo
  end
end
