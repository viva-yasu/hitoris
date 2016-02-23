class AddNameAndNearestStationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :nearest_station, :string
  end
end
