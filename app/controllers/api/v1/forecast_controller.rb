class Api::V1::ForecastController < Api::V1::BaseController
  def index
    render json: WeatherSerializer.new(Weather.new(weather_data(location), location))
  end
end
