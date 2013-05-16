class RemoveCreditCardFields < ActiveRecord::Migration
  def self.up
    remove_column :users, :credit_card_number
    remove_column :users, :expiration_month
    remove_column :users, :expiration_year
    remove_column :users, :security_code
    remove_column :users, :credit_card_type
    
  end

  def self.down
  end
end
