require 'rails_helper'
describe CurrentForecast do

  it "Exists" do
    attrs = {
        uv_index: 7.04,
        low_temp: 59,
        humidity: 28,
        date_time: 1600530774,
        high_temp: 75,
        feels_like: 60.5,
        visibility: 10000,
        sunset_time: 1600563710,
        description: 'few clouds',
        current_temp: 60,
        sunrise_time: 1600519516,
    }

    current = CurrentForecast.new(attrs)
    expect(current).to be_a CurrentForecast
    expect(current.uv_index).to eq(7.04)
    expect(current.low_temp).to eq(59)
    expect(current.humidity).to eq(28)
    expect(current.date_time).to eq(1600530774)
    expect(current.high_temp).to eq(75)
    expect(current.feels_like).to eq(60.5)
    expect(current.visibility).to eq(10000)
    expect(current.sunset_time).to eq(1600563710)
    expect(current.description).to eq('few clouds')
    expect(current.current_temp).to eq(60)
    expect(current.sunrise_time).to eq(1600519516)
  end
end
