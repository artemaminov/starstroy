class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.text :about
      t.text :contacts

      t.timestamps null: false
    end
  end
end
