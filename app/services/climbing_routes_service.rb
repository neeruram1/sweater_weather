class ClimbingRoutesService
  def nearby_routes(coords)
    to_json("get-routes-for-lat-lon?lat=#{coords[:lat]}&lon=#{coords[:lon]}")
  end

  private

  def conn
    Faraday.new('https://www.mountainproject.com/data/') do |f|
      f.params[:key] = ENV['mountain_project_key'].to_s
    end
  end

  def to_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
