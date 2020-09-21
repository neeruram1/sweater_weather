require 'rails_helper'
describe ClimbingRoute do
  it "exists" do
    latitude = 39.738453
    longitude = -104.984853
    coords = "#{latitude}"+','+"#{longitude}"

    attrs = {
      id: nil,
      name: 'Dopey Duck',
      type: 'Trad',
      rating: '5.9',
      location: [
        'North Carolina',
        '2. Northern Mountains Region',
        'Linville Gorge',
        'Shortoff Mountain'
      ],
      distance_to_route: '76.876',
    }

    route = ClimbingRoute.new(attrs, coords)

    expect(route).to be_a ClimbingRoute
    expect(route.id).to eq(nil)
    expect(route.name).to eq('Dopey Duck')
    expect(route.type).to eq('Trad')
    expect(route.rating).to eq('5.9')
    expect(route.location).to be_a Array
    expect(route.location).to eq(["North Carolina", "2. Northern Mountains Region", "Linville Gorge", "Shortoff Mountain"])
    expect(route.distance_to_route).to eq('76.876')
  end
end
