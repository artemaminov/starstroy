class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :title
      t.text :info

      t.timestamps null: false
    end
  end
end
