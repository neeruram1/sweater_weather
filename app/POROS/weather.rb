class Weather
  attr_reader :id,
              :daily_forecasts,
              :hourly_forecasts,
              :current_forecast

  def initialize(results)
    @id = nil
    @daily_forecasts = daily_forecasts(results)
    @hourly_forecasts = hourly_forecasts(results)
    @current_forecast = current_forecast(results)
  end

  def current_forecast(results)
    CurrentForecast.new(results)
  end

  def daily_forecasts(results)
    results[:daily].map {|data| DailyForecast.new(data)}
  end

  def hourly_forecasts(results)
    results[:hourly].map {|data| HourlyForecast.new(data)}
  end
end
