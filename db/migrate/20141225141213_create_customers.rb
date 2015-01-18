class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :title
      t.text :info
      t.string :phone
      t.string :address
      t.string :site

      t.timestamps null: false
    end
  end
end
