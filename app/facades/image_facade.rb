class ImageFacade
  def image_data(location)
    results = ImageService.new.background_img(location)
    {
      id: nil,
      source: 'Unsplash',
      location: location[:location],
      author: results[:results][0][:user][:name],
      image_url: results[:results][0][:urls][:raw],
      author_profile_link: results[:results][0][:user][:links][:html],
      source_url: 'https://unsplash.com/?utm_source=sweater_weather&utm_medium=referral'
    }
  end
end
