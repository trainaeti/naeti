class AddSkuToCourseDates < ActiveRecord::Migration
  def self.up
    add_column :course_dates, :sku, :string
    remove_column :courses, :sku
  end

  def self.down
    remove_column :course_dates, :sku
    add_column :courses, :sku, :string
  end
end
