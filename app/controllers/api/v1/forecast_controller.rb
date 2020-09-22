class Api::V1::ForecastController < Api::V1::BaseController
  def index
    render json: WeatherSerializer.new(Weather.new(weather_data(forecast_params), location))
  end

  private

  def forecast_params
    params.permit(:location)
  end
end
