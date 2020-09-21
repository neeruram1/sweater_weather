class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email
  attribute :api_key, if: Proc.new { |record| record.id.nil? == false }
end
