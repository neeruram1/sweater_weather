class WeatherFacade
  def forecast(coords)
    weather_service.forecast(coords)
  end

  private

  def weather_service
    WeatherService.new
  end
end
