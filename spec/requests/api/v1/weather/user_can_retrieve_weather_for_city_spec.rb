require 'rails_helper'
describe "User can request forecast for a city" do
  it "Sends a current, daily, and hourly forecast for a specific city", :vcr do
    location = 'denver, co'

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful
    response.content_type == "application/json"

    weather = JSON.parse(response.body, symbolize_names: true)

    expect(weather).to be_a Hash
    expect(weather[:data][:weather][:attributes]).to have_key :current_forecast
    expect(weather[:data][:weather][:attributes]).to have_key :hourly_forecast
    expect(weather[:data][:weather][:attributes]).to have_key :daily_forecast
  end

  it "Current forecast returns specific attributes", :vcr do
    location = 'denver, co'

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful
    response.content_type == "application/json"

    data = JSON.parse(response.body, symbolize_names: true)
    current_forecast = data[:data][:weather][:attributes][:current_forecast]

    expect(current_forecast[:attributes]).to have_key :current_temp
    expect(current_forecast[:attributes]).to have_key :current_high
    expect(current_forecast[:attributes]).to have_key :current_low
    expect(current_forecast[:attributes]).to have_key :date_time
    expect(current_forecast[:attributes]).to have_key :description
    expect(current_forecast[:attributes]).to have_key :sunrise_time
    expect(current_forecast[:attributes]).to have_key :sunset_time
    expect(current_forecast[:attributes]).to have_key :feels_like
    expect(current_forecast[:attributes]).to have_key :humidity
    expect(current_forecast[:attributes]).to have_key :visibility
    expect(current_forecast[:attributes]).to have_key :uv_index

    expect(current_forecast[:attributes]).to_not have_key :pressure
    expect(current_forecast[:attributes]).to_not have_key :dew_point
    expect(current_forecast[:attributes]).to_not have_key :clouds
    expect(current_forecast[:attributes]).to_not have_key :wind_speed
    expect(current_forecast[:attributes]).to_not have_key :wind_deg
  end
end
