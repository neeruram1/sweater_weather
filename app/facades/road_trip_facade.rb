class RoadTripFacade
  def road_trip(params, user)
    binding.pry
    user.road_trips.create!(api_key: params[:api_key], origin: params[:origin], destination: params[:destination], travel_time: 'placeholder')
  end

  def distance(params)


  end

  private

  def mapquest_service
    MapQuestService.new
  end

  def weather_service
    WeatherService.new
  end
end
