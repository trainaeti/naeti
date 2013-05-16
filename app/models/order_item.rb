class OrderItem < ActiveRecord::Base
  belongs_to  :order
  belongs_to  :course
  belongs_to  :course_date
  belongs_to  :registrant
  
  default_scope order("created_at desc")
  
  scope :confirmed, where(:is_confirmed=>true)
  
end
