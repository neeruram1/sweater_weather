require 'rails_helper'
describe "User login" do
  it "A user can login", :vcr do
    michael = User.create(email: 'michael@bluthco.org', password: 'banana', password_confirmation: 'banana')

    body = {
      email: 'michael@bluthco.org',
      password: 'banana',
    }

    post '/api/v1/sessions', params: body

    expect(response).to be_successful
    expect(response.status).to eq(200)
    response.content_type == "application/json"

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user[:data]).to have_key(:type)
    expect(user[:data][:type]).to eq('user')
    expect(user[:data]).to have_key(:id)
    expect(user[:data][:id]).to eq(michael.id.to_s)
    expect(user[:data][:attributes][:email]).to eq(michael.email)
    expect(user[:data][:attributes]).to have_key(:api_key)
    expect(user[:data][:attributes][:api_key]).to eq(michael.api_key)
    end
  end
