class HourlyForecast
  def initialize(data)
    @date_time = data[:dt]
    @temp = data[:temp]
  end
end
