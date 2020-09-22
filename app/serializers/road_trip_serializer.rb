class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :origin, :destination, :travel_time, :arrival_temperature, :arrival_forecast_description
  belongs_to :user
end
