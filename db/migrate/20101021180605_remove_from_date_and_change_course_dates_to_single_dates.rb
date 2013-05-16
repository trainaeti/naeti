class RemoveFromDateAndChangeCourseDatesToSingleDates < ActiveRecord::Migration
  def self.up
    remove_column :course_dates, :from_date
    remove_column :course_dates, :to_date
    add_column :course_dates, :course_date, :string
  end

  def self.down
  end
end
