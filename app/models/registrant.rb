class Registrant < ActiveRecord::Base

  has_many :shopping_cart_items
  has_many :order_items
  
  validates_presence_of :first_name, :last_name, :address, :city, :state_id, :company_name

  validates :zip, :presence => true, 
                    :length => {:minimum => 5},
                    :format => {:with => /^([0-9]{5})(?:[-\s]*([0-9]{4}))?$/i}
                    
  validates :email, :presence => true, 
                    :length => {:minimum => 3, :maximum => 254},
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}  

  validates :phone, :presence => true, 
                    :length => {:minimum => 5},
                    :format => {:with => /^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$/i}

  validates :cell, :presence => true, 
                    :length => {:minimum => 5},
                    :format => {:with => /^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$/i}
                    
  validates :is_terms, :format=>{:with=>/true/}
           
           
end
