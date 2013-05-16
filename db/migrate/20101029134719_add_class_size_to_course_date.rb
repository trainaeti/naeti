class AddClassSizeToCourseDate < ActiveRecord::Migration
  def self.up
    add_column :course_dates, :class_size, :integer
  end

  def self.down
    remove_column :course_dates, :class_size
  end
end
