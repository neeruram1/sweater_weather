class Api::V1::ForecastController < ApplicationController
  def index
    render json: WeatherSerializer.new(WeatherFacade.new.forecast(location_param))
  end

  private

  def location_param
    params.permit(:location)
  end
end
