class User < ApplicationRecord
  validates_presence_of :email
  validates_presence_of :password
  has_secure_password

  before_create do
    self.api_key = SecureRandom.hex
  end
end
