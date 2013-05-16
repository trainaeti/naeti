class AddOfflineTransactionNotesToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :offline_transaction_notes, :text
  end

  def self.down
    remove_column :orders, :offline_transaction_notes
  end
end
