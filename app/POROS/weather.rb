class Weather
  attr_reader :id,
              :current_forecast,
              :hourly_forecast,
              :daily_forecast

  def initialize(results)
    @id = nil
    @current_forecast = CurrentForecast.new(results)
    @hourly_forecast = results[:hourly].map {|data| HourlyForecast.new(data)}
    @daily_forecast = results[:daily].map {|data| DailyForecast.new(data)}
  end
end
