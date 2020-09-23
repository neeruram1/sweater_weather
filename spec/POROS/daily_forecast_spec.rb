require 'rails_helper'
describe DailyForecast do

  it "Exists" do
    attrs = {
      date_time: 1600530774,
      day_of_week: 'Tuesday',
      description: 'few clouds',
      precipitation: 4.0,
      low_temp_daily: 59,
      high_temp_daily: 75
    }

    daily = DailyForecast.new(attrs)
    expect(daily).to be_a DailyForecast
    expect(daily.day_of_week).to eq('Tuesday')
    expect(daily.low_temp_daily).to eq(59)
    expect(daily.date_time).to eq(1600530774)
    expect(daily.high_temp_daily).to eq(75)
    expect(daily.description).to eq('few clouds')
    expect(daily.precipitation).to eq(4.0)
  end
end
