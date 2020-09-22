class AddDistanceToRoadTrip < ActiveRecord::Migration[5.2]
  def change
    add_column :road_trips, :arrival_temperature, :float
    add_column :road_trips, :arrival_forecast_description, :string
  end
end
