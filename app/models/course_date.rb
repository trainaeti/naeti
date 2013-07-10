class CourseDate < ActiveRecord::Base
  default_scope order("start_date asc, id asc") 
  
  include ActionView::Helpers::TextHelper
    
  belongs_to  :course

  has_many  :shopping_cart_items, :dependent=>:delete_all
  has_many  :order_items, :dependent=>:delete_all
  belongs_to  :users
  
  before_create :set_sku
  scope :current, where("start_date > ?", Date.today.strftime('%Y-%m-%d')) 
  scope :available, where("class_size >= ?", OrderItem.where(:course_date_id => id).count) 
  scope :waiting, where("class_size < ?", OrderItem.where(:course_date_id => id).count) 
    
  scope :current_and_recent, where("start_date > ?", Date.today.months_ago(1).strftime('%Y-%m-%d'))
  
  def set_sku
    self.sku = truncate(self.course.course_category.name.upcase, :length=>3, :omission=>'') << "-" << self.start_date.strftime('%Y%m%d') << "-" << self.end_date.strftime('%Y%m%d')
  end  

  def instructor_tokens=(ids)
    self.user_ids = ids.split(",")
  end
  
end
