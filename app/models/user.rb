class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_many :road_trips
  has_secure_password

  before_create do
    self.api_key = SecureRandom.hex
  end
end
