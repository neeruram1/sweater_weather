require 'rails_helper'

describe 'Getting latitude and longitude from Mapquest API' do
  it "Gets longitude and latitude by sending location to mapquest api request", :vcr do
    location = 'denver, co'
    latitude = 39.738453
    longitude = -104.984853
    service = MapquestService.new

    response = service.coords(location)

    expect(response).to be_a Hash

    expect(response[:providedLocation]).to have_key :location
    expect(response[:locations][0]).to have_key :latLng
    expect(response[:locations][0][:latLng]).to have_key :lat
    expect(response[:locations][0][:latLng]).to have_key :lng

    expect(response[:providedLocation][:location]).to eq(location)
    expect(response[:locations][0][:latLng][:lat]).to eq(latitude)
    expect(response[:locations][0][:latLng][:lng]).to eq(longitude)
  end

  it "Can get the distance between two routes" do
    location1 = 'denver, co'
    latitude1 = 39.738453
    longitude1 = -104.984853
    coords1 = {lat: latitude1, lon: longitude1}

    location2 = 'lovers leap'
    latitude2 = 39.616
    longitude2 = -105.214
    coords1 = {lat: latitude2, lon: longitude2}

    service = MapquestService.new

    response = service.distance_between_routes(coords1, coords2)

    expect(response).to be_a Hash

    expect(response[:route]).to have_key :distance
  end
end
