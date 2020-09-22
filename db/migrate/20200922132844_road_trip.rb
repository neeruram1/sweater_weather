class RoadTrip < ActiveRecord::Migration[5.2]
  def change
    create_table :road_trips do |t|
      t.string :api_key
      t.string :origin
      t.string :destination
      t.string :travel_time
      t.timestamps
    end
  end
end
