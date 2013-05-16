class AddShoppingCartIdToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :shopping_cart_id, :integer
  end

  def self.down
    remove_column :orders, :shopping_cart_id
  end
end
