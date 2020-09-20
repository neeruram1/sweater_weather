class Api::V1::ForecastController < ApplicationController
  def index
    render json: serialize_weather(weather(location))
  end

  private

  def location
    params.permit(:location)
  end

  def serialize_weather(data)
    WeatherSerializer.new(data)
  end

  def weather(location)
    WeatherFacade.new.forecast(location)
  end
end
