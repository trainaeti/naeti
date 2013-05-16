class CreateRegistrants < ActiveRecord::Migration
  def self.up
    create_table :registrants do |t|
      t.string :company_name
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.integer :state_id
      t.string :zip
      t.string :email
      t.string :phone
      t.string :cell

      t.timestamps
    end
     
    add_column :shopping_cart_items, :registrant_id, :integer
    add_column :course_registrants, :registrant_id, :integer
    
    remove_column :course_registrants, :company_name
    remove_column :course_registrants, :first_name
    remove_column :course_registrants, :last_name
    remove_column :course_registrants, :address
    remove_column :course_registrants, :city
    remove_column :course_registrants, :state_id
    remove_column :course_registrants, :zip
    remove_column :course_registrants, :email
    remove_column :course_registrants, :phone
    remove_column :course_registrants, :cell  
    
  end

  def self.down
    drop_table :registrants
    remove_column :shopping_cart_items, :registrant_id
    remove_column :course_registrants, :registrant_id  

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
end
