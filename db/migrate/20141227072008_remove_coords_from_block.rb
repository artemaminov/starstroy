class RemoveCoordsFromBlock < ActiveRecord::Migration
  def change
    remove_column :blocks, :coord_x, :decimal, precision: 10, scale: 6
    remove_column :blocks, :coord_y, :decimal, precision: 10, scale: 6
  end
end
