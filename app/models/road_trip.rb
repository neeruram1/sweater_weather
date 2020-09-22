class RoadTrip < ApplicationRecord
  validates :api_key, presence: true
  validates :origin, presence: true
  validates :destination, presence: true
  validates :travel_time, presence: true
  validates :arrival_forecast, presence: true
  belongs_to :user
end
