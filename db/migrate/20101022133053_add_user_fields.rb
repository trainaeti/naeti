class AddUserFields < ActiveRecord::Migration
  def self.up
    
      add_column  :users, :title, :string
    	add_column  :users, :first_name, :string	
    	add_column  :users, :middle_name, :string
    	add_column  :users, :last_name, :string	
    	add_column  :users, :suffix, :string
    	add_column  :users, :date_of_birth, :date	
    	add_column  :users, :social_security_number, :string	
    	add_column  :users, :cell, :string	
    	add_column  :users, :address2, :string
    	add_column  :users, :company_link, :string
    	add_column  :users, :company_name, :string	
    	add_column  :users, :company_phone, :string
    	add_column  :users, :company_phone_extension, :string
    	add_column  :users, :picture_file_name, :string
    	add_column  :users, :courses_taken_link, :string
    	add_column  :users, :in_case_of_emergency, :string
    	add_column  :users, :student_status, :string
    	
    	
  end

  def self.down
  end
end
