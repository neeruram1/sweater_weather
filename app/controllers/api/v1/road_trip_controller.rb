class Api::V1::RoadTripController < Api::V1::BaseController
  before_action :find_by_api_key, only: [:create]

  def create
    @user.nil? ? errors(:unauthorized, :incorrect_api_key) : create_road_trip(trip_params, @user)
  end

  private

  def trip_params
    params.permit(:origin, :destination, :api_key)
  end
end
