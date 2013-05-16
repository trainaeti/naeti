class AddFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column  :users, :country, :string
    add_column  :users, :credit_card_number, :text
    add_column  :users, :expiration_month, :string
    add_column  :users, :expiration_year, :string
    
  end

  def self.down
  end
end
