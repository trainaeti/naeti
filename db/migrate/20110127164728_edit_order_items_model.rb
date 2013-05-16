class EditOrderItemsModel < ActiveRecord::Migration
  def self.up
    remove_column :shopping_cart_items, :quantity
    remove_column :order_items, :quantity
    remove_column :order_items, :transaction_id
    remove_column :order_items, :price
    remove_column :order_items, :offline_transaction_notes

    add_column :order_items, :is_confirmed, :boolean
    add_column :order_items, :is_www, :boolean
    add_column :order_items, :is_purchaseorder, :boolean
    add_column :order_items, :is_offline, :boolean
     
  end

  def self.down

    add_column :shopping_cart_items, :quantity, :integer
    add_column :order_items, :quantity, :integer
    add_column :order_items, :transaction_id, :integer
    add_column :order_items, :price, :decimal
    add_column :order_items, :offline_transaction_notes, :boolean

    remove_column :order_items, :is_confirmed
    remove_column :order_items, :is_www
    remove_column :order_items, :is_purchaseorder
    remove_column :order_items, :is_offline
      
  end
end
