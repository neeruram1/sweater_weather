require 'rails_helper'

describe "Can use coordinates to return forecast" do
  it "Can use coordinates to pull data back from weather API" do
    location = 'denver, co'
    latitude = 39.738453
    longitude = -104.984853

    mapquest_service = MapquestService.new
    weather_service = WeatherService.new

    response = weather_service.forecast(coords)

    expect(response).to be_a Hash
    expect(response).to have_key :lat
    expect(response).to have_key :lon
    expect(response).to have_key :current
    expect(response).to have_key :weather

    expect(response[:lat]).to eq(latitude)
    expect(response[:lat]).to eq(longitude)
  end
end
