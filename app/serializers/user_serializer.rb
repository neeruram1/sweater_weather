class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email
  attribute :api_key
end
