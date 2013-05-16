class AddRegistrantIdToOrderItems < ActiveRecord::Migration
  def self.up
    add_column :orders, :registrant_id, :integer
    add_column :order_items, :registrant_id, :integer

  end

  def self.down
    remove_column :orders, :registrant_id
    remove_column :order_items, :registrant_id
  end
end
