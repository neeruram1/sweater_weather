class Weather
  attr_reader :id,
              :location,
              :daily_forecasts,
              :hourly_forecasts,
              :current_forecast

  def initialize(results, location)
    @id = nil
    @location = location[:location]
    @daily_forecasts = results[:daily].map { |data| DailyForecast.new(data) }
    @hourly_forecasts = results[:hourly].map { |data| HourlyForecast.new(data) }
    @current_forecast = CurrentForecast.new(results)
  end
end
