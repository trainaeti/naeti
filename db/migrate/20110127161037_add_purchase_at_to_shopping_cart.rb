class AddPurchaseAtToShoppingCart < ActiveRecord::Migration
  def self.up
    add_column :shopping_carts, :purchased_at, :datetime
  end

  def self.down
    remove_column :shopping_carts, :purchased_at
  end
end
