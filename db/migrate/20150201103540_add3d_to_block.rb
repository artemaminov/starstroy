class Add3dToBlock < ActiveRecord::Migration
  def change
    add_column :blocks, :three_dimension_template, :string
  end
end
