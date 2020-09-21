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

  it "Sends back an error message if password doesn't match password confirmation", :vcr do
    body = {
      email: 'michael@bluthco.org',
      password: 'banana',
      password_confirmation: 'bananastand'
    }

    post '/api/v1/users', params: body

    expect(response).to_not be_successful
    response.content_type == "application/json"

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user[:errors][0][:status]).to eq(400)
    expect(user[:errors][0][:title]).to eq("Bad Request")
    expect(user[:errors][0][:detail]).to eq("Password confirmation doesn't match Password")
  end

  #sad paths: email has been taken, email empty, password empty, password confirmation empty, user already exists
end
