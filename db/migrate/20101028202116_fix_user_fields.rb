class FixUserFields < ActiveRecord::Migration
  def self.up

    remove_column :users, :name
    remove_column :users, :country
    add_column  :users, :state_id, :integer
    
  end

  def self.down
  end
end
