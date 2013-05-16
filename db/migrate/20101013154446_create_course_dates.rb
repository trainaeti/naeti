class CreateCourseDates < ActiveRecord::Migration
  def self.up
    create_table :course_dates do |t|
      t.integer :course_id
      t.date :from_date
      t.date :to_date

      t.timestamps
    end
  end

  def self.down
    drop_table :course_dates
  end
end
