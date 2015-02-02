class AddCoopToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :coop, :text
  end
end
