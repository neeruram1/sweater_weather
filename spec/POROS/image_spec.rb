require 'rails_helper'
describe Image do

  it "Exists" do
    attrs = {
      id: 50,
      author: 'neeru ram',
      source: 'Unsplash',
      location: 'denver, co',
      image_url: 'myimage.com',
      source_url: 'https://unsplash.com/?utm_source=sweater_weather&utm_medium=referral',
      author_profile_link: 'mylink.com'
    }

    image = Image.new(attrs)
    expect(image).to be_a Image
    expect(image.id).to eq(50)
    expect(image.author).to eq('neeru ram')
    expect(image.source).to eq('Unsplash')
    expect(image.location).to eq('denver, co')
    expect(image.image_url).to eq('myimage.com')
    expect(image.author_profile_link).to eq('mylink.com')
    expect(image.source_url).to eq('https://unsplash.com/?utm_source=sweater_weather&utm_medium=referral')
  end
end
