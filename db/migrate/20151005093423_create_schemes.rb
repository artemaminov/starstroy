class CreateSchemes < ActiveRecord::Migration
  def change
    create_table :schemes do |t|
      t.string :title
      t.integer :position
      t.references :block, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
