class AddPoNumberToOrderItems < ActiveRecord::Migration
  def self.up
    add_column :order_items, :po_number, :string
  end

  def self.down
    remove_column :order_items, :po_number
  end
end
