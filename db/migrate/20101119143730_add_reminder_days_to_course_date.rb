class AddReminderDaysToCourseDate < ActiveRecord::Migration
  def self.up
    add_column :course_dates, :reminder_days, :integer
  end

  def self.down
    remove_column :course_dates, :reminder_days
  end
end
