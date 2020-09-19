require 'rails_helper'

describe 'Getting latitude and longitude from Mapquest API' do
  it "Gets longitude and latitude by sending location to mapquest api request", :vcr do
    location = 'denver, co'
    latitude = 39.738453
    longitude = -104.984853
    service = MapquestService.new

    response = service.get_coords(location)

    expect(response[:providedLocation][:location]).to eq(location)
    expect(response[:locations].first[:latLng][:lat]).to eq(latitude)
    expect(response[:locations].first[:latLng][:lng]).to eq(longitude)
  end
end
