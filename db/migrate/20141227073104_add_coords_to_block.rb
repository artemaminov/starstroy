class AddCoordsToBlock < ActiveRecord::Migration
  def change
    add_column :blocks, :latitude, :decimal, precision: 10, scale: 6
    add_column :blocks, :longitude, :decimal, precision: 10, scale: 6
  end
end
