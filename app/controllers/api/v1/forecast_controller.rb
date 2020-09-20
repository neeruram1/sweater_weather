class Api::V1::ForecastController < ApplicationController
  def index
    serialize_weather(weather(location)).serialized_json
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
