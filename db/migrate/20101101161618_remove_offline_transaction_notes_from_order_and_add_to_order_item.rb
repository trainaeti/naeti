class RemoveOfflineTransactionNotesFromOrderAndAddToOrderItem < ActiveRecord::Migration
  def self.up
    remove_column :orders, :offline_transaction_notes
    add_column  :order_items, :offline_transaction_notes, :text
  end

  def self.down
  end
end
