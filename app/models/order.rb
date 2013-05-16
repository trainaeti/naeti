class Order < ActiveRecord::Base

  belongs_to :shopping_cart
  has_many :transactions, :class_name => "OrderTransaction"
  has_many  :order_items
  belongs_to  :user
  
  default_scope order("created_at desc")
  
  attr_accessor :card_number, :card_verification, :is_purchase_order, :po_number

  validate_on_create :validate_card
  
  def purchase_order
    shopping_cart.update_attribute(:purchased_at, Time.now)
    create_purchase_order_items
    true
  end
  
  def purchase
  
    response = GATEWAY.purchase(price_in_cents, credit_card, purchase_options)
    transactions.create!(:action => "purchase", :amount => price_in_cents, :response => response)
    
    if (Rails.env=="production")
      shopping_cart.update_attribute(:purchased_at, Time.now) if response.success?
      create_order_items if response.success?
      response.success?
    else
      shopping_cart.update_attribute(:purchased_at, Time.now)
      create_order_items
      true
    end        
  end
  
  def price_in_cents
    (shopping_cart.total*100).round
  end

  private

  def create_purchase_order_items  
    ShoppingCartItem.where(:shopping_cart_id=>shopping_cart.id).each do |cart| 
      @order_item = OrderItem.new
      @order_item.course_id = cart.course_id
      @order_item.course_date = cart.course_date
      @order_item.registrant_id= cart.registrant_id
      @order_item.order_id = self.id
      @order_item.is_confirmed= false
      @order_item.is_purchaseorder= true
      @order_item.po_number = self.po_number
      @order_item.save 
    end	
  end
    
  def create_order_items
    ShoppingCartItem.where(:shopping_cart_id=>shopping_cart.id).each do |cart| 
      @order_item = OrderItem.new
      @order_item.course_id = cart.course_id
      @order_item.course_date = cart.course_date
      @order_item.registrant_id= cart.registrant_id
      @order_item.order_id = self.id
      @order_item.is_confirmed= true
      @order_item.is_www= true
      @order_item.save 
    end	
  end
  
  def purchase_options
    {
      :ip => ip_address,
      :billing_address => {
        :name     => "#{first_name} #{last_name}" ,
        :address1 => address,
        :city     => city,
        :state_id    => State.where(:id=>10).first.abbreviation,
        :country  => "US",
        :zip      => zip
      },
      :order_id => rand(Time.now) #shopping_cart.id
    }
  end
  
  def validate_card
  
    if is_purchase_order.blank?
      unless credit_card.valid?
        credit_card.errors.full_messages.each do |message|
          errors.add_to_base message
        end
      end
    else
    
      errors.add(:first_name, "cannot be blank") if first_name.blank?
      errors.add(:last_name, "cannot be blank") if last_name.blank?
      errors.add(:address, "cannot be blank") if address.blank?
      errors.add(:city, "cannot be blank") if city.blank?
      errors.add(:state_id, "cannot be blank") if state_id.blank?
      errors.add(:zip, "cannot be blank") if zip.blank?
      errors.add(:email, "cannot be blank") if email.blank?
      errors.add(:phone, "cannot be blank") if phone.blank?
      errors.add(:po_number, "cannot be blank") if po_number.blank?
    end
  end
  
  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      :type               => card_type,
      :number             => card_number,
      :verification_value => card_verification,
      :month              => card_expires_on.month,
      :year               => card_expires_on.year,
      :first_name         => first_name,
      :last_name          => last_name
    )
  end
end