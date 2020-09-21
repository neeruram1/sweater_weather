class ClimbingRoutesService
  def nearby_routes(coords)

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
