require 'rails_helper'

describe 'Getting latitude and longitude from Mapquest API' do
  it "Gets longitude and latitude by sending location to mapquest api request", :vcr do
    location = 'denver, co'
    latitude = "39.738453"
    longitude = "-104.984853"
    service = MapquestService.new

    response = service.get_coords(location)
    parsed = JSON.parse(response.body)
    expect(parsed[:results][:providedLocation][:location]).to eq(location)
    expect(parsed[:results][:providedLocation][:locations][:latlng])[:lat].to eq(latitude)
    expect(parsed[:results][:providedLocation][:locations][:latlng])[:lng].to eq(longitude)
  end
end
