require 'rails_helper'
describe "User can request nearby climbing routes for a location" do
  it "Sends nearby climbing routes for a location", :vcr do
    location = 'los angeles, ca'

    get "/api/v1/climbing_routes?location=#{location}"

    expect(response).to be_successful
    response.content_type == "application/json"

    routes_data = JSON.parse(response.body, symbolize_names: true)

    expect(routes_data).to be_a Hash
    expect(routes_data[:data]).to be_a Hash
    expect(routes_data[:data][:type]).to eq("climbing route")
    expect(routes_data[:data][:id]).to eq('null')
    expect(routes_data[:data][:attributes]).to have_key :location
    expect(routes_data[:data][:attributes]).to have_key :forecast
    expect(routes_data[:data][:attributes][:forecast]).to be_a Hash
    expect(routes_data[:data][:attributes][:forecast]).to have_key :summary
    expect(routes_data[:data][:attributes][:forecast]).to have_key :temperature
    expect(routes_data[:data][:attributes]).to have_key :routes
    expect(routes_data[:data][:attributes][:routes]).to be_a Array
    expect(routes_data[:data][:attributes][:routes][0]).to have_key :name
    expect(routes_data[:data][:attributes][:routes][0]).to have_key :type
    expect(routes_data[:data][:attributes][:routes][0]).to have_key :rating
    expect(routs_data[:data][:attributes][:routes][0]).to have_key :location
    expect(routes_data[:data][:attributes][:routes][0][:location]).to be_a Array
    expect(routs_data[:data][:attributes][:routes][0]).to have_key :distance_to_route
  end
end
