require 'rails_helper'

describe 'Getting a background image for a city from Unsplash API' do
  it "Gets background image by sending city as search query", :vcr do
    location = 'chicago, il'
    service = ImageService.new

    response = service.background_img(location)

     expect(response).to be_a Hash
     expect(response[:results]).to be_a Array
     expect(response[:results][0]).to be_a Hash
     expect(response[:results][0]).to have_key :id
     expect(response[:results][0]).to have_key :created_at
     expect(response[:results][0]).to have_key :updated_at
     expect(response[:results][0]).to have_key :promoted_at
     expect(response[:results][0]).to have_key :width
     expect(response[:results][0]).to have_key :height
     expect(response[:results][0]).to have_key :color
     expect(response[:results][0]).to have_key :description
     expect(response[:results][0]).to have_key :alt_description
     expect(response[:results][0]).to have_key :urls
     expect(response[:results][0]).to have_key :links
     expect(response[:results][0]).to have_key :categories
     expect(response[:results][0]).to have_key :likes
     expect(response[:results][0]).to have_key :liked_by_user
     expect(response[:results][0]).to have_key :current_user_collections
     expect(response[:results][0]).to have_key :sponsorship
     expect(response[:results][0]).to have_key :user
     expect(response[:results][0]).to have_key :tags
  end
end
