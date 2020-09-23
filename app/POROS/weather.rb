class Weather
  attr_reader :id,
              :location,
              :daily_forecasts,
              :hourly_forecasts,
              :current_forecast

  def initialize(data, location)
    @id = nil
    @location = location
    @daily_forecasts = data[:daily].map { |data| DailyForecast.new(data) }
    @hourly_forecasts = data[:hourly].map { |data| HourlyForecast.new(data) }
    @current_forecast = CurrentForecast.new(current_forecast_data(data))
  end

  def current_forecast_data(data)
    {
    uv_index: data[:current][:uvi],
    current_temp: data[:current][:temp],
    humidity: data[:current][:humidity],
    feels_like: data[:current][:feels_like],
    visibility: data[:current][:visibility],
    date_time:  parse_time(data[:current][:dt]),
    high_temp: data[:daily][0][:temp][:max],
    low_temp:  data[:daily][0][:temp][:min],
    description: data[:current][:weather][0][:main],
    sunset_time: parse_time(data[:current][:sunset]),
    sunrise_time: parse_time(data[:current][:sunrise]),
  }
  end

  def parse_time(time)
    DateTime.strptime(time.to_s, '%s')
  end
end
