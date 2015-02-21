class RemoveThreeDimensionTemplateFromBlock < ActiveRecord::Migration
  def change
    remove_column :blocks, :three_dimension_template, :string
  end
end
