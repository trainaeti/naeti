class AddFieldsToRegistrants < ActiveRecord::Migration
  def self.up
    add_column :registrants, :is_terms, :boolean
    add_column :registrants, :is_paid, :boolean
    add_column :registrants, :is_creditcard, :boolean
    add_column :registrants, :is_purchaseorder, :boolean
    add_column :registrants, :is_phone, :boolean
    add_column :registrants, :payment_description, :string
  end

  def self.down
    remove_column :registrants, :is_terms
    remove_column :registrants, :is_paid
    remove_column :registrants, :is_creditcard
    remove_column :registrants, :is_purchaseorder
    remove_column :registrants, :is_phone
    remove_column :registrants, :payment_description
  end
end
