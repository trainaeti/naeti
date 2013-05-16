class AddFieldsToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :email, :string
    add_column :orders, :phone, :string
  end

  def self.down
    remove_column :orders, :email
    remove_column :orders, :phone  
  end
  
end
