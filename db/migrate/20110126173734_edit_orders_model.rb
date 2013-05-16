class EditOrdersModel < ActiveRecord::Migration
  def self.up
    remove_column :orders, :session_id
    remove_column :orders, :user_id
    remove_column :orders, :total
    remove_column :orders, :transaction_id
    remove_column :orders, :registrant_id
    
    add_column :orders, :user_id, :integer

    add_column :orders, :ip_address, :string
    add_column :orders, :first_name, :string
    add_column :orders, :last_name, :string
    add_column :orders, :address, :string
    add_column :orders, :city, :string
    add_column :orders, :state_id, :integer
    add_column :orders, :zip, :string
    add_column :orders, :card_type, :string
    add_column :orders, :card_expires_on, :date

   
  end

  def self.down
    remove_column :orders, :user_id

    remove_column :orders, :ip_address
    remove_column :orders, :first_name
    remove_column :orders, :last_name
    remove_column :orders, :address
    remove_column :orders, :city
    remove_column :orders, :state_id
    remove_column :orders, :zip
    remove_column :orders, :card_type
    remove_column :orders, :card_expires_on

    add_column :orders, :session_id, :integer
    add_column :orders, :user_id, :integer
    add_column :orders, :total, :integer
    add_column :orders, :transaction_id, :integer
    add_column :orders, :registrant_id, :integer
    
  end
end
