require 'rails_helper'
describe 'Getting climbing routes for a location based on latitude and longitude' do
  it "Gets a climbing route by sending lat and lon as a search query", :vcr do
    climbing_routes_service = ClimbingRoutesService.new
    latitude = 39.738453
    longitude = -104.984853
    coords = {lat: latitude.round(2), lon: longitude.round(2)}

    response = climbing_routes_service.nearby_routes(coords)

    expect(response).to be_a Hash
    expect(response[:routes]).to be_a Array
    expect(response[:routes][0]).to be_a Hash
    expect(response[:routes][0]).to have_key :id
    expect(response[:routes][0]).to have_key :name
    expect(response[:routes][0]).to have_key :type
    expect(response[:routes][0]).to have_key :rating
    expect(response[:routes][0]).to have_key :stars
    expect(response[:routes][0]).to have_key :starVotes
    expect(response[:routes][0]).to have_key :pitches
    expect(response[:routes][0]).to have_key :location
    expect(response[:routes][:location][0]).to be_a Array
    expect(response[:routes][0]).to have_key :url
    expect(response[:routes][0]).to have_key :longitude
    expect(response[:routes][0]).to have_key :latitude
  end

  #sad path - no routes exist
end
