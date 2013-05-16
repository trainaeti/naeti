class MakeCourseDateEdits < ActiveRecord::Migration
  def self.up
    add_column :course_dates, :start_date, :date
    add_column :course_dates, :end_date, :date    
  end

  def self.down
    remove_column :course_dates, :start_date
    remove_column :course_dates, :end_date
  end
end
