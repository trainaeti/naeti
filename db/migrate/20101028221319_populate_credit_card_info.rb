class PopulateCreditCardInfo < ActiveRecord::Migration
  def self.up
    
    drop_table :expiration_years
    drop_table :expiration_months
    
    credit_card_type = CreditCardType.create(:name=>"Visa")
    credit_card_type = CreditCardType.create(:name=>"MasterCard")
    credit_card_type = CreditCardType.create(:name=>"American Express")
    credit_card_type = CreditCardType.create(:name=>"Discover")
    
  end

  def self.down
  end
end
