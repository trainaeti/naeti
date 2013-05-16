class CreateCourseUsers < ActiveRecord::Migration
  def self.up
    create_table :course_users do |t|
      t.integer :user_id
      t.integer :course_id
      t.boolean :instructor
      t.timestamps
    end
  end

  def self.down
    drop_table :course_users
  end
end
