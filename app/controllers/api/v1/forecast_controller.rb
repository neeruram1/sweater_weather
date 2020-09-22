class Api::V1::ForecastController < Api::V1::BaseController
  def index
    render json: WeatherSerializer.new(WeatherFacade.new.forecast(location))
  end
end
