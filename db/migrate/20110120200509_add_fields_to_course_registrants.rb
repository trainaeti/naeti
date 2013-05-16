class AddFieldsToCourseRegistrants < ActiveRecord::Migration
  def self.up
    add_column :course_registrants, :company_name, :string
    add_column :course_registrants, :first_name, :string
    add_column :course_registrants, :last_name, :string
    add_column :course_registrants, :address, :string
    add_column :course_registrants, :city, :string
    add_column :course_registrants, :state_id, :integer
    add_column :course_registrants, :zip, :string
    add_column :course_registrants, :email, :string
    add_column :course_registrants, :phone, :string
    add_column :course_registrants, :cell, :string
  end

  def self.down
    remove_column :course_registrants, :company_name
    remove_column :course_registrants, :first_name
    remove_column :course_registrants, :last_name
    remove_column :course_registrants, :address
    remove_column :course_registrants, :city
    remove_column :course_registrants, :state
    remove_column :course_registrants, :zip
    remove_column :course_registrants, :email
    remove_column :course_registrants, :phone
    remove_column :course_registrants, :cell  
  end
end
