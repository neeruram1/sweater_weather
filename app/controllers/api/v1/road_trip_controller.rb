class Api::V1::RoadTripController < Api::V1::BaseController
  before_action :find_user_by_api_key, only: [:create]

  def create
    @user.nil? ? errors(:unauthorized, :incorrect_api_key) : create_road_trip(trip_params)
  end

  private

  def trip_params
    params.permit(:origin, :destination, :api_key)
  end

  def create_road_trip(params)
    road_trip = @user.road_trips.create(RoadTripFacade.new.road_trip_data(params))
    options = { include: [:user] }
    road_trip_success(RoadTripSerializer.new(road_trip, options))
  end

  def road_trip_success(road_trip)
    render json: road_trip, status: :created
  end
end
