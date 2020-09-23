require 'rails_helper'
describe ImageFacade do
  it "data", :vcr do
    location = { location: 'denver, co' }
    facade = ImageFacade.new
    data = facade.data(location)

    expect(data).to be_a Hash
    expect(data).to have_key :id
    expect(data).to have_key :location
    expect(data).to have_key :author
    expect(data).to have_key :image_url
    expect(data).to have_key :author_profile_link
    expect(data).to have_key :source_url
    expect(data[:source_url]).to eq('https://unsplash.com/?utm_source=sweater_weather&utm_medium=referral')
    expect(data[:source]).to eq('Unsplash')
    expect(data[:id]).to eq(nil)
    expect(data[:location]).to eq(location[:location])
  end
end
