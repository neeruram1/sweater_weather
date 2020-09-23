require 'rails_helper'
describe "User can request background image for a location" do
  it "Sends an appropriate background image for a specific city", :vcr do
    location = 'los angeles, ca'

    get "/api/v1/background?location=#{location}"

    expect(response).to be_successful
    response.content_type == "application/json"

    image_data = JSON.parse(response.body, symbolize_names: true)

    expect(image_data).to be_a Hash
    expect(image_data[:data][:type]).to eq("image")
    expect(image_data[:data][:attributes]).to have_key :author
    expect(image_data[:data][:attributes]).to have_key :source
    expect(image_data[:data][:attributes]).to have_key :location
    expect(image_data[:data][:attributes]).to have_key :image_url
    expect(image_data[:data][:attributes]).to have_key :source_url
    expect(image_data[:data][:attributes]).to have_key :author_profile_link
  end

  it "Sends an error if no location sent", :vcr do
    location = nil

    get "/api/v1/background?location=#{location}"

    expect(response).to_not be_successful
    response.content_type == "application/json"

    errors = JSON.parse(response.body, symbolize_names: true)

    expect(errors).to be_a Hash
    expect(errors[:errors][:title]).to eq("No Content")
    expect(errors[:errors][:code]).to eq(400)
    expect(errors[:errors][:detail]).to eq('Enter a valid location')
  end
end
