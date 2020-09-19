class WeatherFacade
  def forecast(location_param)
    weather_service.forecast(coords(location_param))
  end

  def coords(location)
    data = mapquest_service.coords(location)
    {lat: data[:locations][0][:latLng][:lat].round(2), lon: data[:locations][0][:latLng][:lng].round(2)}
  end

  private

  def weather_service
    WeatherService.new
  end

  def mapquest_service
    MapquestService.new
  end
end
