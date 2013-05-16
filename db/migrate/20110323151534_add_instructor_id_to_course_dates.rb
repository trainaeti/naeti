class AddInstructorIdToCourseDates < ActiveRecord::Migration
  def self.up
    add_column :course_dates, :user_id, :integer
  end

  def self.down
    remove_column :course_dates, :user_id
  end
end
