class AddCommonToAttachment < ActiveRecord::Migration
  def change
    add_column :attachments, :common, :boolean, default: false
  end
end
