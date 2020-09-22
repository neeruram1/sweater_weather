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
    MapquestService.new.length_between_routes(lat_lng(params[:origin]), lat_lng(params[:destination]))[:route][:formattedTime]
  end

  def forecast(params)
    {
      temp: weather_data(params[:destination])[:current][:temp],
      description: weather_data(params[:destination])[:current][:description]
    }
  end
end
