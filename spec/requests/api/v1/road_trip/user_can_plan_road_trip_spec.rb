require 'rails_helper'
describe 'A user can plan a road trip' do
  it "User can send two locations and plan a road trip", :vcr do
    michael = User.create(email: 'michael@bluthco.org', password: 'banana', password_confirmation: 'banana')

    body = {
      origin: 'denver, co',
      destination: 'boulder, co',
      api_key: michael.api_key
    }

    post '/api/v1/road_trip', params: body

    expect(response).to be_successful
    expect(response.status).to eq(201)
    response.content_type == "application/json"

    road_trip = JSON.parse(response.body, symbolize_names: true)

    expect(road_trip[:data]).to have_key(:type)
    expect(road_trip[:data][:type]).to eq('road_trip')
    expect(road_trip[:data]).to have_key(:id)
    expect(road_trip[:data]).to have_key(:relationships)
    expect(road_trip[:data][:relationships]).to have_key(:user)
    expect(road_trip[:data][:relationships][:user]).to have_key(:data)
    expect(road_trip[:data][:relationships][:user]).to have_key(:data)
    expect(road_trip[:data][:attributes]).to have_key(:origin)
    expect(road_trip[:data][:attributes]).to have_key(:destination)
    expect(road_trip[:data][:attributes]).to have_key(:travel_time)
    expect(road_trip[:data][:attributes]).to have_key(:arrival_temperature)
    expect(road_trip[:data][:attributes]).to have_key(:arrival_forecast_description)
  end

  it "User can't plan road trip if invalid api key sent", :vcr do
    michael = User.create(email: 'michael@bluthco.org', password: 'banana', password_confirmation: 'banana')

    post '/api/v1/sessions', params: body

    body = {
      origin: 'denver, co',
      destination: 'boulder, co',
      api_key: '239874255'
    }

    post '/api/v1/road_trip', params: body

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    response.content_type == "application/json"

    error = JSON.parse(response.body, symbolize_names: true)

    expect(error[:errors]).to have_key(:code)
    expect(error[:errors]).to have_key(:title)
    expect(error[:errors]).to have_key(:detail)

    expect(error[:errors][:code]).to eq(401)
    expect(error[:errors][:title]).to eq('Unauthorized')
    expect(error[:errors][:detail]).to eq('Cannot verify your api key')
  end

  it "User can't plan road trip if no api key sent", :vcr do
    michael = User.create(email: 'michael@bluthco.org', password: 'banana', password_confirmation: 'banana')

    post '/api/v1/sessions', params: body

    body = {
      origin: 'denver, co',
      destination: 'boulder, co',
      api_key: ''
    }

    post '/api/v1/road_trip', params: body

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    response.content_type == "application/json"

    error = JSON.parse(response.body, symbolize_names: true)

    expect(error[:errors]).to have_key(:code)
    expect(error[:errors]).to have_key(:title)
    expect(error[:errors]).to have_key(:detail)

    expect(error[:errors][:code]).to eq(401)
    expect(error[:errors][:title]).to eq('Unauthorized')
    expect(error[:errors][:detail]).to eq('Cannot verify your api key')
  end
end
