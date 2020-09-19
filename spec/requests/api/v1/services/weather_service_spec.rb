require 'rails_helper'

describe "Can use coordinates to return forecast" do
  it "Can use coordinates to pull data back from weather API", :vcr do
    location = 'denver, co'
    latitude = 39.738453
    longitude = -104.984853
    coords = {lat: latitude.round(2), lon: longitude.round(2)}

    mapquest_service = MapquestService.new
    weather_service = WeatherService.new

    response = weather_service.forecast(coords)

    expect(response).to be_a Hash
    expect(response).to have_key :lat
    expect(response).to have_key :lon
    expect(response).to have_key :current
    expect(response).to have_key :hourly
    expect(response).to have_key :daily
    expect(response[:current]).to have_key :weather
    expect(response[:daily]).to be_a Array
    expect(response[:hourly]).to be_a Array
    expect(response[:current]).to be_a Hash

    expect(response[:lat]).to eq(coords[:lat])
    expect(response[:lon]).to eq(coords[:lon])
  end
end
