class Weather
  attr_reader :id,
              :daily_forecast,
              :hourly_forecast,
              :current_forecast

  def initialize(results)
    @id = nil
    @current_forecast = CurrentForecast.new(results)
    @daily_forecast = results[:daily].map {|data| DailyForecast.new(data)}
    @hourly_forecast = results[:hourly].map {|data| HourlyForecast.new(data)}
  end
end
