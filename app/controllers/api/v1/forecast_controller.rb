class Api::V1::ForecastController < ApplicationController
  def index
    WeatherFacade.new.forecast(location_param)
    binding.pry
  end

  private

  def location_param
    params.permit(:location)
  end
end
