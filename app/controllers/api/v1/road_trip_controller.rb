class Api::V1::RoadTripController < Api::V1::BaseController

  def create
    user = User.find_by(api_key: params[:api_key])
    if user.nil?
      render json: ErrorSerializer.new(user, 401).invalid_credentials, status: :unauthorized
    else
      road_trip = road_trip(road_trip_params, user)
      options = { include: [:user] }
      render json: RoadTripSerializer.new(road_trip, options), status: :ok
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end

  def road_trip(road_trip_params, user)
    RoadTripFacade.new.road_trip(road_trip_params, user)
  end
end
