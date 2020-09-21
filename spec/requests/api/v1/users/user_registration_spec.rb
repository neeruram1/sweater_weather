require 'rails_helper'
describe "User registration" do
  it "Creates a new user", :vcr do
    body = {
      email: 'michael@bluthco.org',
      password: 'banana',
      password_confirmation: 'banana'
    }

    post '/api/v1/users', params: body

    expect(response).to be_successful
    response.content_type == "application/json"

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user[:data]).to have_key(:type)
    expect(user[:data][:type]).to eq('user')
    expect(user[:data]).to have_key(:id)
    expect(user[:data][:attributes][:email]).to eq(body[:email])
    expect(user[:data][:attributes]).to have_key(:api_key)
  end

  #sad paths: password doesn't match, email has been taken, email empty, password empty, password confirmation empty 
end
