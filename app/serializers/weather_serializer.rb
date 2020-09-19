class WeatherSerializer
  def initialize(weather)
    @weather = weather
  end

  def data_hash
    {
      data:
      {
        weather: {
          type: 'forecast',
          attributes: {
            current_forecast: @weather.current_forecast,
            daily_forecast: @weather.daily_forecast,
            hourly_forecast: @weather.hourly_forecast
          }
        }
      }
    }
  end
end
