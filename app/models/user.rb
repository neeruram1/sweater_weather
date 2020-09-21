class User < ApplicationRecord
  validates_presence_of :email
  validates_presence_of :password
  has_secure_password

  def generate_api_key
    update(api_key: SecureRandom.hex)
    self
  end
end
