class OnSiteTraining < ActiveRecord::Base
  

  attr_accessor :company, :email, :address, :city, :state, :zip, :phone, :fax, :name_of_class, :location_of_training, :number_of_students, :dates_of_training, :billing_address

  validates_presence_of  :name, :company, :email, :address, :city, :state, :zip, :phone, :fax, :name_of_class, :location_of_training, :number_of_students, :dates_of_training, :billing_address
  
  validates_format_of :email, :with => /^\S+\@(\[?)[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,4}|[0-9]{1,4})(\]?)$/ix, :message => " is not a valid email address format.", :on=>:create
  
  
end
