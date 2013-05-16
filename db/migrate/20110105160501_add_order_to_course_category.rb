class AddOrderToCourseCategory < ActiveRecord::Migration
  def self.up
    add_column :course_categories, :order, :integer
    add_column :courses, :order, :integer
  end

  def self.down
    remove_column :course_categories, :order
    remove_column :courses, :order
  end
end
