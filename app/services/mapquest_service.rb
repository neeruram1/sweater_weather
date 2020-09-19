class MapquestService

  def coords(location)
    to_json("?&location=#{location}")[:results].first
  end

  private

  def to_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('http://www.mapquestapi.com/geocoding/v1/address') do |f|
      f.params[:key] = "#{ENV['mapquest_key']}"
    end
  end
end
