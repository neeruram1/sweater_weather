class ImageService
  def background_img(location)
    to_json("/search/photos?query=#{location}%20city%20buildings&order_by=relevant")
  end

  private

  def to_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://api.unsplash.com/') do |f|
      f.params[:client_id] = ENV['unsplash_access_key'].to_s
    end
  end
end
