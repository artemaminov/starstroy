class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :title
      t.text :info
      t.string :popup
      t.date :finish
      t.references :customer, index: true
      t.decimal :coord_x, precision: 10, scale: 6
      t.decimal :coord_y, precision: 10, scale: 6

      t.timestamps null: false
    end
    add_foreign_key :blocks, :customers
  end
end
