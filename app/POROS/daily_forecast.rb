class DailyForecast
  attr_reader :date_time,
              :day_of_week,
              :description,
              :precipitation,
              :low_temp_daily,
              :high_temp_daily

  def initialize(data)
    @date_time = data[:date_time]
    @low_temp_daily = data[:low_temp_daily]
    @high_temp_daily = data[:high_temp_daily]
    @description = data[:description]
    @precipitation = data[:precipitation]
    @day_of_week = data[:day_of_week]
  end
end
