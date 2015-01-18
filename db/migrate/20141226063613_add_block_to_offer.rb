class AddBlockToOffer < ActiveRecord::Migration
  def change
    add_reference :offers, :block, index: true
    add_foreign_key :offers, :blocks
  end
end
