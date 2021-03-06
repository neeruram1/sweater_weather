class Weather
  attr_reader :id,
              :location,
              :daily_forecasts,
              :hourly_forecasts,
              :current_forecast

  def initialize(data)
    @id = nil
    @location = data[1][:location]
    @daily_forecasts = data[0][:daily].map { |data| DailyForecast.new(daily_data(data)) }
    @hourly_forecasts = data[0][:hourly].map { |data| HourlyForecast.new(hourly_data(data)) }
    @current_forecast = CurrentForecast.new(current_data(data[0]))
  end

  def current_data(data)
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
    sunrise_time: parse_time(data[:current][:sunrise])
  }
  end

  def daily_data(data)
    {
      date_time: parse_time(data[:dt]),
      low_temp_daily: data[:temp][:min],
      high_temp_daily: data[:temp][:max],
      description: data[:weather][0][:main],
      precipitation: total_precipitation(data),
      day_of_week: parse_time(data[:dt]).strftime('%A')
    }
  end

  def hourly_data(data)
    {
      date_time: parse_time(data[:dt]),
      hourly_temp: data[:temp],
    }
  end

  def parse_time(time)
    DateTime.strptime(time.to_s, '%s')
  end

  def total_precipitation(data)
    if no_precipitation?(data)
      0
    elsif rain_present?(data) && snow_present?(data) == false
      data[:rain]
    elsif snow_present?(data) && rain_present?(data) == false
      data[:snow]
    else
      data[:rain] + data[:snow]
    end
  end

  def no_precipitation?(data)
    data[:rain].nil? && data[:snow].nil?
  end

  def rain_present?(data)
    data[:rain].nil? == false
  end

  def snow_present?(data)
    data[:snow].nil? == false
  end
end
