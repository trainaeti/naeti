class CreditCardType < ActiveRecord::Base
  has_many  :users
end
