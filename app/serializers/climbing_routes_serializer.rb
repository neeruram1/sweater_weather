class ClimbingRoutesSerializer
  def initialize(weather, climbing_routes)
    @weather = weather
    @climbing_routes = climbing_routes
  end

  def data_hash
    {
      data: {
        id: 'null',
        type: 'climbing route',
        attributes: {
          location: @weather.location,
          forecast: {
            summary: @weather.current_forecast.description,
            temperature: @weather.current_forecast.current_temp
          },
          routes: @climbing_routes.as_json
        }
      }
    }
  end
end
