class AddAdminAndInstructorToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :admin, :boolean
    add_column :users, :instructor, :boolean
  end

  def self.down
    remove_column :users, :instructor
    remove_column :users, :admin
  end
end
