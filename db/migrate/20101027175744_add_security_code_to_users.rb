class AddSecurityCodeToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :security_code, :string
  end

  def self.down
    remove_column :users, :security_code
  end
end
