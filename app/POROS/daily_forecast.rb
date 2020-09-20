class DailyForecast
  attr_reader :date_time,
              :day_of_week,
              :description,
              :precipitation,
              :low_temp_daily,
              :high_temp_daily

  def initialize(data)
    @date_time = parse_time(data[:dt])
    @low_temp_daily = data[:temp][:min]
    @high_temp_daily = data[:temp][:max]
    @description = data[:weather][0][:main]
    @precipitation = total_precipitation(data)
    @day_of_week = parse_time(data[:dt]).strftime('%A')
  end

  def total_precipitation(data)
    if no_precipitation?
      0
    elsif rain_present? && snow_present? == false
      data[:rain]
    elsif snow_present? && rain_present == false
      data[:snow]
    else
      data[:rain] + data[:snow]
    end
  end

  def no_precipitation?
    data[:rain].nil? && data[:snow].nil?
  end

  def rain_present?
    data[:rain].nil == false
  end

  def snow_present?
    data[:snow].nil == false
  end

  def parse_time(time)
    DateTime.strptime(time.to_s, '%s')
  end
end
