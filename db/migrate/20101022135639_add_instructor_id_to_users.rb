class AddInstructorIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :instructor_id, :integer
  end

  def self.down
    remove_column :users, :instructor_id
  end
end
