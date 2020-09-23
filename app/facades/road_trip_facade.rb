class RoadTripFacade
  include Serviceable
  def road_trip_data(params)
    {
      api_key: params[:api_key],
      origin: params[:origin],
      destination: params[:destination],
      travel_time: travel_time(params),
      arrival_forecast_description: forecast(params)[:description],
      arrival_temperature: forecast(params)[:temp]
    }
  end

  def travel_time(params)
    travel_time_service(lat_lng(params[:origin]), lat_lng(params[:destination]))[:route][:formattedTime]
  end

  def forecast(params)
    {
      temp: current_temp(params[:destination]),
      description: forecast_description(params[:destination])
    }
  end

  def current_temp(location)
    weather_data(location)[0][:current][:temp]
  end

  def forecast_description(location)
    weather_data(location)[0][:current][:weather][0][:description]
  end

  def travel_time_service(origin, destination)
    MapquestService.new.length_between_routes(origin, destination)
  end
end
