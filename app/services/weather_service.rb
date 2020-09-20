class WeatherService
  def forecast(coords)
    to_json("/data/2.5/onecall?&units=imperial&lat=#{coords[:lat]}&lon=#{coords[:lon]}")
  end

  private

  def conn
    Faraday.new('https://api.openweathermap.org') do |f|
      f.params[:appid] = "#{ENV['weather_key']}"
    end
  end

  def to_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
