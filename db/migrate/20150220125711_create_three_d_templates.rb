class CreateThreeDTemplates < ActiveRecord::Migration
  def change
    create_table :three_d_templates do |t|
      t.string :title
      t.string :script
      t.references :block, index: true

      t.timestamps null: false
    end
    add_foreign_key :three_d_templates, :blocks
  end
end
