class Api::V1::RoadTripController < Api::V1::BaseController

  def create

    user = User.find_by(api_key: params[:api_key])

    coords1 = mapquest_service.coords(params[:origin])
    coords2 = mapquest_service.coords(params[:destination])
    distance = mapquest_service.length_between_routes(coords1, coords2)[:distance]
    time = mapquest_service.length_between_routes(coords1, coords2)[:realTime]
    forecast = weather_service.forecast(coords2)
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end

  def mapquest_service
    MapquestService.new
  end

  def weather_service
    WeatherService.new
  end
end
