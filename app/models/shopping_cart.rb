class ShoppingCart < ActiveRecord::Base
  has_many  :shopping_cart_items
  belongs_to  :user
  has_one :order
end
