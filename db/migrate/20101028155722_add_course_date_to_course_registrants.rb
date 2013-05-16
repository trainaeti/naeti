class AddCourseDateToCourseRegistrants < ActiveRecord::Migration
  def self.up
    add_column  :course_registrants, :course_date_id, :integer
  end

  def self.down
  end
end
