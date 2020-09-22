class AddDistanceToRoadTrip < ActiveRecord::Migration[5.2]
  def change
    add_column :road_trips, :arrival_forecast, :string
  end
end
