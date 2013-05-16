class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :address, :city, :state_id, :zip, :phone
  
  attr_accessor :credit_card_number, :expiration_month, :expiration_year, :credit_card_type, :security_code
  
  #validates_presence_of :name
  validates_uniqueness_of :email, :case_sensitive => false
  
  belongs_to  :state
  belongs_to  :credit_card_type
  
  has_many  :course_dates
  has_many  :shopping_carts
  has_many  :orders
  
  has_many  :courses_taught, :class_name=>"Course", :foreign_key=>"instructor_id"
  has_many  :course_registrants
  has_many  :user_assets, :dependent=>:delete_all
  #has_many  :course_assets, :dependent=>:delete_all
    
  validates_presence_of :first_name, :last_name, :address, :city, :state_id, :zip
  validates_presence_of :credit_card_number, :credit_card_type, :security_code, :unless => :update
  
  default_scope order("last_name")
  
  scope :by_search_term,  proc {|search_term| where("(users.first_name like ? or users.email like ?)", search_term, search_term) }
  scope :admins, where(:admin=>1)
  scope :instructors, where(:instructor=>1)
  scope :general, where("(admin is null or admin = 0) and (instructor is null or instructor = 0)")

  
  def full_address
    if self.state
      state_name = self.state.name
    else
      state_name = ""
    end
    
    output = self.address + "<br />" + self.city + ", " + state_name
    return output
    
  end
  
  def name
    if self.first_name and self.last_name
      self.first_name + " " + self.last_name
    else
      if self.first_name
        self.first_name
      else
        if self.last_name
          self.last_name
        end
      end
    end
    
  end

  def to_param
    "#{self.id}-#{self.first_name.strip.downcase}-#{self.last_name.strip.downcase}"
  end
    
end
