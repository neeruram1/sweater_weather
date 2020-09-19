require 'rails_helper'

describe 'Getting latitude and longitude from Mapquest API' do
  it "Gets longitude and latitude by sending location to mapquest api request", :vcr do
    location = 'denver, co'
    latitude = 39.738453
    longitude = -104.984853
    service = MapquestService.new

    response = service.get_coords(location)

    expect(response).to be_a Hash

    expect(response[:providedLocation]).to have_key :location
    expect(response[:locations][0]).to have_key :latLng
    expect(response[:locations][0][:latLng]).to have_key :lat
    expect(response[:locations][0][:latLng]).to have_key :lng

    expect(response[:providedLocation][:location]).to eq(location)
    expect(response[:locations][0][:latLng][:lat]).to eq(latitude)
    expect(response[:locations][0][:latLng][:lng]).to eq(longitude)
  end
end