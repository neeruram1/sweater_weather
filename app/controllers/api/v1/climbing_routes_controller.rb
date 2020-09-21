class Api::V1::ClimbingRoutesController < ApplicationController
  def index
    render json: serialize_routes(weather(location), routes(location))
  end

  private

  def location
    params.permit(:location)
  end

  def serialize_routes(weather, climbing_routes)
    ClimbingRoutesSerializer.new(weather, climbing_routes).data_hash
  end

  def weather(location)
    WeatherFacade.new.forecast(location)
  end

  def routes(location)
    ClimbingRoutesFacade.new.climbing_routes(location[:location])
  end
end
