class RoadTripFacade
  def road_trip(params, user)
    user.road_trips.create!(api_key: params[:api_key], origin: params[:origin], destination: params[:destination], travel_time: travel_time(params), arrival_forecast_description: forecast_description(params), arrival_temperature: forecast_temp(params))
  end

  def travel_time(params)
    coords1 = coords(params[:origin])
    coords2 = coords(params[:destination])
    mapquest_service.length_between_routes(coords1, coords2)[:route][:formattedTime]
  end

  def forecast_temp(params)
   weather.forecast(params[:destination]).current_forecast.current_temp
  end

  def forecast_description(params)
    weather.forecast(params[:destination]).current_forecast.description
  end

  def coords(location)
    data = mapquest_service.coords(location)
    "#{data[:locations][0][:latLng][:lat]}" + ',' + "#{data[:locations][0][:latLng][:lng]}"
  end

  private

  def mapquest_service
    MapquestService.new
  end

  def weather
    WeatherFacade.new
  end
end
