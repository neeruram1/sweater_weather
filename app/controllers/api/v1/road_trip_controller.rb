class Api::V1::RoadTripController < Api::V1::BaseController

  def create
    user = User.find_by(api_key: params[:api_key])
    road_trip = road_trip(road_trip_params, user)
    options = { include: [:user] }
    render json: RoadTripSerializer.new(road_trip, options), status: :ok
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end

  def road_trip(road_trip_params, user)
    RoadTripFacade.new.road_trip(road_trip_params, user)
  end
end
