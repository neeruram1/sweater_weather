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

  it "Can get the distance between two routes", :vcr do
    latitude1 = 39.738453
    longitude1 = -104.984853
    coords1 = "#{latitude1}"+','+"#{longitude1}"

    latitude2 = 39.616
    longitude2 = -105.214
    coords2 = "#{latitude2}"+','+"#{longitude2}"

    service = MapquestService.new
    response = service.length_between_routes(coords1, coords2)
    expect(response).to be_a Hash
    expect(response[:route]).to have_key :distance
  end

  it "Can get the travel time between two routes", :vcr do
    latitude1 = 39.738453
    longitude1 = -104.984853
    coords1 = "#{latitude1}"+','+"#{longitude1}"

    latitude2 = 39.616
    longitude2 = -105.214
    coords2 = "#{latitude2}"+','+"#{longitude2}"

    service = MapquestService.new
    response = service.length_between_routes(coords1, coords2)
    expect(response).to be_a Hash
    expect(response[:route]).to have_key :realTime
  end
end
