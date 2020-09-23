require 'rails_helper'
describe HourlyForecast do

  it "Exists" do
    attrs = {
      date_time: 1600530774,
      hourly_temp: 75,
    }

    hourly = HourlyForecast.new(attrs)
    expect(hourly).to be_a HourlyForecast
    expect(hourly.date_time).to eq(1600530774)
    expect(hourly.hourly_temp).to eq(75)
  end
end
