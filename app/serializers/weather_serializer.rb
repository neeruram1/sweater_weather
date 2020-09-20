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
                date_time: parse_time(@current_forecast[:dt]),
                description: @current_forecast[:weather][0][:description],
                sunrise_time: parse_time(@current_forecast[:sunrise]),
                sunset_time: parse_time(@current_forecast[:sunset]),
                feels_like: @current_forecast[:feels_like],
                humidity: @current_forecast[:humidity],
                visibility: @current_forecast[:visibility],
                uv_index: @current_forecast[:uvi]
                }
              },
            daily_forecast: {
              attributes: {
                day_of_week: 'placeholder',
                description: 'placeholder',
                precipitation: 'placeholder',
                current_high: 'placeholder',
                current_low: 'placeholder'
              }
            },
            hourly_forecast: {
              attributes: {
                day_of_week: 'placeholder',
                hour_of_day: 'placeholder',
                temp: 'placeholder'
              }
            }
          }
        }
      }
    }
  end
end

def parse_time(time)
  DateTime.strptime(time, '%s')
end
