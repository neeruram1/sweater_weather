class Weather
  attr_reader :id,
              :current_forecast,
              :hourly_forecast,
              :daily_forecast

  def initialize(data)
    @id = nil
    @current_forecast = data[:current]
    @hourly_forecast = data[:hourly]
    @daily_forecast = data[:daily]
  end
end
