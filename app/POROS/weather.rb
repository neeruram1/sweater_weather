class Weather
  attr_reader :id,
              :daily_forecasts,
              :hourly_forecasts,
              :current_forecast

  def initialize(results)
    @id = nil
    @daily_forecasts = results[:daily].map { |data| DailyForecast.new(data) }
    @hourly_forecasts = results[:hourly].map { |data| HourlyForecast.new(data) }
    @current_forecast = CurrentForecast.new(results)
  end
end
