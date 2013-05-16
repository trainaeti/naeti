class AddCreditCardTypeToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :credit_card_type, :string
  end

  def self.down
    remove_column :users, :credit_card_type
  end
end
