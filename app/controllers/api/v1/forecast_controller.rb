class Api::V1::ForecastController < Api::V1::BaseController
  def index
    render json: serialize_weather(weather(location))
  end

  private

  def serialize_weather(data)
    WeatherSerializer.new(data)
  end

  def weather(location)
    WeatherFacade.new.forecast(location)
  end
end
