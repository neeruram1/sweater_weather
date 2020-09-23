require 'rails_helper'
describe "User can request forecast for a city" do
  it "Sends a current, daily, and hourly forecast for a specific city", :vcr do
    location = 'denver, co'

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful
    response.content_type == "application/json"

    weather = JSON.parse(response.body, symbolize_names: true)

    expect(weather).to be_a Hash
    expect(weather[:data][:attributes]).to have_key :current_forecast
    expect(weather[:data][:attributes]).to have_key :hourly_forecasts
    expect(weather[:data][:attributes]).to have_key :daily_forecasts
    expect(weather[:data][:attributes]).to have_key :location

    expect(weather[:data][:attributes]).to_not have_key :minutely_forecasts
  end

  it "Current forecast returns specific attributes", :vcr do
    location = 'denver, co'

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful
    response.content_type == "application/json"

    data = JSON.parse(response.body, symbolize_names: true)
    current_forecast = data[:data][:attributes][:current_forecast]

    expect(current_forecast).to be_a Hash

    expect(current_forecast).to have_key :current_temp
    expect(current_forecast).to have_key :high_temp
    expect(current_forecast).to have_key :low_temp
    expect(current_forecast).to have_key :date_time
    expect(current_forecast).to have_key :description
    expect(current_forecast).to have_key :sunrise_time
    expect(current_forecast).to have_key :sunset_time
    expect(current_forecast).to have_key :feels_like
    expect(current_forecast).to have_key :humidity
    expect(current_forecast).to have_key :visibility
    expect(current_forecast).to have_key :uv_index

    expect(current_forecast).to_not have_key :pressure
    expect(current_forecast).to_not have_key :dew_point
    expect(current_forecast).to_not have_key :clouds
    expect(current_forecast).to_not have_key :wind_speed
    expect(current_forecast).to_not have_key :wind_deg
    expect(current_forecast).to_not have_key :hourly_temp
  end

  it "Daily forecast returns specific attributes", :vcr do
    location = 'denver, co'

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful
    response.content_type == "application/json"

    data = JSON.parse(response.body, symbolize_names: true)
    daily_forecasts = data[:data][:attributes][:daily_forecasts]

    expect(daily_forecasts).to be_a Array
    expect(daily_forecasts[0]).to be_a Hash

    expect(daily_forecasts[0]).to have_key :day_of_week
    expect(daily_forecasts[0]).to have_key :date_time
    expect(daily_forecasts[0]).to have_key :description
    expect(daily_forecasts[0]).to have_key :low_temp_daily
    expect(daily_forecasts[0]).to have_key :high_temp_daily
    expect(daily_forecasts[0]).to have_key :precipitation

    expect(daily_forecasts[0]).to_not have_key :sunrise_time
    expect(daily_forecasts[0]).to_not have_key :sunset_time
    expect(daily_forecasts[0]).to_not have_key :current_temp
    expect(daily_forecasts[0]).to_not have_key :feels_like
    expect(daily_forecasts[0]).to_not have_key :humidity
    expect(daily_forecasts[0]).to_not have_key :visibility
    expect(daily_forecasts[0]).to_not have_key :uv_index
    expect(daily_forecasts[0]).to_not have_key :pressure
    expect(daily_forecasts[0]).to_not have_key :dew_point
    expect(daily_forecasts[0]).to_not have_key :clouds
    expect(daily_forecasts[0]).to_not have_key :wind_speed
    expect(daily_forecasts[0]).to_not have_key :wind_deg
    expect(daily_forecasts[0]).to_not have_key :high_temp
    expect(daily_forecasts[0]).to_not have_key :low_temp
    expect(daily_forecasts[0]).to_not have_key :hourly_temp
  end

  it "Hourly forecast returns specific attributes", :vcr do
    location = 'denver, co'

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful
    response.content_type == "application/json"

    data = JSON.parse(response.body, symbolize_names: true)
    hourly_forecasts = data[:data][:attributes][:hourly_forecasts]

    expect(hourly_forecasts[0]).to have_key :hourly_temp
    expect(hourly_forecasts[0]).to have_key :date_time

    expect(hourly_forecasts[0]).to_not have_key :day_of_week
    expect(hourly_forecasts[0]).to_not have_key :description
    expect(hourly_forecasts[0]).to_not have_key :low_temp_daily
    expect(hourly_forecasts[0]).to_not have_key :high_temp_daily
    expect(hourly_forecasts[0]).to_not have_key :precipitation
    expect(hourly_forecasts[0]).to_not have_key :sunrise_time
    expect(hourly_forecasts[0]).to_not have_key :sunset_time
    expect(hourly_forecasts[0]).to_not have_key :current_temp
    expect(hourly_forecasts[0]).to_not have_key :feels_like
    expect(hourly_forecasts[0]).to_not have_key :humidity
    expect(hourly_forecasts[0]).to_not have_key :visibility
    expect(hourly_forecasts[0]).to_not have_key :uv_index
    expect(hourly_forecasts[0]).to_not have_key :pressure
    expect(hourly_forecasts[0]).to_not have_key :dew_point
    expect(hourly_forecasts[0]).to_not have_key :clouds
    expect(hourly_forecasts[0]).to_not have_key :wind_speed
    expect(hourly_forecasts[0]).to_not have_key :wind_deg
    expect(hourly_forecasts[0]).to_not have_key :high_temp
    expect(hourly_forecasts[0]).to_not have_key :low_temp
  end
end
