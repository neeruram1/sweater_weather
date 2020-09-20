class WeatherSerializer
  def initialize(weather)
    @current_forecast = weather.current_forecast
    @daily_forecast = weather.daily_forecast
    @hourly_forecast = weather.hourly_forecast
  end

  def data_hash
    {
      data:
      {
        weather: {
          type: 'forecast',
          attributes: {
            current_forecast: {
              attributes: {
                current_temp: @current_forecast[:temp],
                current_high:  @daily_forecast[0][:temp][:max],
                current_low:  @daily_forecast[0][:temp][:min],
                date_time: DateTime.strptime(@current_forecast[:dt].to_s, '%s'),
                description: @current_forecast[:weather][0][:description],
                sunrise_time: DateTime.strptime(@current_forecast[:sunrise].to_s, '%s'),
                sunset_time: DateTime.strptime(@current_forecast[:sunset].to_s, '%s'),
                feels_like: @current_forecast[:feels_like],
                humidity: @current_forecast[:humidity],
                visibility: @current_forecast[:visibility],
                uv_index: @current_forecast[:uvi]
                }
              },
            daily_forecast: @daily_forecast,
            hourly_forecast: @hourly_forecast
          }
        }
      }
    }
  end
end
