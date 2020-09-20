class Api::V1::ForecastController < ApplicationController
  def index
    WeatherSerializer.new(WeatherFacade.new.forecast(location_param)).serialized_json
  end

  private

  def location_param
    params.permit(:location)
  end
end
