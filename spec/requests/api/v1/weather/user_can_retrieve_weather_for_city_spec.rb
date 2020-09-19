require 'rails_helper'
describe "User can request forecast for a city" do
  it "Sends a current, daily, and hourly forecast for a specific city", :vcr do
    location = 'denver, co'

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful
    response.content_type == "application/json"

    forecast = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(forecast[:data]).to have_key [:current]
    expect(forecast[:data]).to have_key [:hourly]
    expect(forecast[:data]).to have_key [:daily]
  end
end
