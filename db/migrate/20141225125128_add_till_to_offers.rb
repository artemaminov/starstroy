class AddTillToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :till, :date
  end
end
