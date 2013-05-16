class AddPdfLocationToCourseDates < ActiveRecord::Migration
  def self.up
    add_column :course_dates, :pdf_location, :string
  end

  def self.down
    remove_column :course_dates, :pdf_location
  end
end
