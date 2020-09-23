require 'rails_helper'
describe Serviceable do
  before(:each) do
    @location = 'denver, co'

    class FakeClass
      include Serviceable
    end

    @fake = FakeClass.new
  end

  it "coordinates", :vcr do
    expect(@fake.coordinates(@location)).to be_a Hash
    expect(@fake.coordinates(@location)).to have_key :lat
    expect(@fake.coordinates(@location)).to have_key :lon
    expect(@fake.coordinates(@location)[:lat]).to eq(39.738453)
    expect(@fake.coordinates(@location)[:lon]).to eq(-104.984853)
  end

  it "weather_data", :vcr do
    expect(@fake.weather_data(@location)).to be_a Hash
    expect(@fake.weather_data(@location)).to have_key :current
    expect(@fake.weather_data(@location)).to have_key :daily
    expect(@fake.weather_data(@location)).to have_key :hourly
  end

  it "lat_lng", :vcr do
    expect(@fake.lat_lng(@location)).to be_a String
    expect(@fake.lat_lng(@location)).to eq('39.738453,-104.984853')
  end
end
