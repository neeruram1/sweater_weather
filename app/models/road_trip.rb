class RoadTrip < ApplicationRecord
  validates :api_key, presence: true
  validates :origin, presence: true
  validates :destination, presence: true
  validates :travel_time, presence: true
  validates :arrival_forecast_description, presence: true
  validates :arrival_temperature, presence: true
  belongs_to :user
end
