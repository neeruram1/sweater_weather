require 'rails_helper'
describe RoadTripFacade do
  before(:each) do
    @neeru = User.create(password: 'cool', email: 'neeru@neeru.com', password_confirmation: 'cool')
    @params = { origin: 'denver, co', destination: 'boulder, co', api_key: @neeru.api_key }
    @facade = RoadTripFacade.new
  end

  it "data", :vcr do
    data = @facade.road_trip_data(@params)

    expect(data).to be_a Hash
    expect(data).to have_key :api_key
    expect(data).to have_key :origin
    expect(data).to have_key :destination
    expect(data).to have_key :travel_time
    expect(data).to have_key :arrival_forecast_description
    expect(data).to have_key :arrival_temperature
    expect(data[:api_key]).to eq(@neeru.api_key)
    expect(data[:origin]).to eq('denver, co')
    expect(data[:destination]).to eq('boulder, co')
  end

  it "travel_time", :vcr do
    expect(@facade.travel_time(@params)).to eq("00:37:35")
  end

  it "forecast", :vcr do
    expect(@facade.forecast(@params)).to be_a Hash
    expect(@facade.forecast(@params)).to have_key :temp
    expect(@facade.forecast(@params)).to have_key :description
  end

  it "current_temp", :vcr do
    expect(@facade.current_temp(@params[:destination])).to eq(71.98)
  end

  it "forecast_description", :vcr do
    expect(@facade.forecast_description(@params[:destination])).to eq('clear sky')
  end
end
