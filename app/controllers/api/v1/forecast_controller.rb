class Api::V1::ForecastController < Api::V1::BaseController
  def index
    params[:location].empty? ? errors(:bad_request, :no_location) : weather_success(forecast_params)
  end

  private

  def forecast_params
    params.permit(:location)
  end

  def weather_success(forecast_params)
    render json: WeatherSerializer.new(Weather.new(weather_data(forecast_params)))
  end
end
