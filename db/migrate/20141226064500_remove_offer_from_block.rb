class RemoveOfferFromBlock < ActiveRecord::Migration
  def change
    remove_reference :blocks, :offer, index: true
    remove_foreign_key :blocks, :offers
  end
end
