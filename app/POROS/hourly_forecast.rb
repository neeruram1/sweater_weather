class HourlyForecast
  attr_reader :date_time,
              :hourly_temp

  def initialize(data)
    @hourly_temp = data[:temp]
    @date_time = parse_time(data[:dt])
  end

  def parse_time(time)
    DateTime.strptime(time.to_s, '%s')
  end
end
