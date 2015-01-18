class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :title
      t.string :attachment

      t.timestamps null: false
    end
  end
end
