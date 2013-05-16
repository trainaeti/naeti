class ShoppingCartItem < ActiveRecord::Base
  belongs_to  :shopping_cart
  belongs_to  :registrant
  belongs_to  :course
  belongs_to  :course_date
  
  default_scope order("created_at desc")
  
end
