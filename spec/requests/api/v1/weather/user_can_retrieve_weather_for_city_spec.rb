require 'rails_helper'
describe "User can request forecast for a city" do
  it "Sends a current, daily, and hourly forecast for a specific city", :vcr do
    location = 'denver, co'

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful
    response.content_type == "application/json"

    weather = JSON.parse(response.body, symbolize_names: true)

    expect(weather[:data][:weather][:attributes]).to have_key :current_forecast
    expect(weather[:data][:weather][:attributes]).to have_key :hourly_forecast
    expect(weather[:data][:weather][:attributes]).to have_key :daily_forecast
  end
end
