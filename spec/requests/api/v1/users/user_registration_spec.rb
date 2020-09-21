require 'rails_helper'
describe "User registration" do
  it "Creates a new user", :vcr do
    body = {
      email: 'michael@bluthco.org',
      password: 'banana',
      password_confirmation: 'banana'
    }

    post '/api/v1/users', params: body

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user[:data]).to have_key(:type)
    expect(user[:data]).to have_key(:id)
    expect(user[:data][:attributes][:email]).to eq(body[:email])
    expect(user[:data][:attributes]).to have_key(:api_key)
  end
end
