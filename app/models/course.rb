class Course < ActiveRecord::Base
  
  
  belongs_to  :instructor, :class_name=>"User", :foreign_key=>"instructor_id"
  
  has_many  :course_dates, :dependent=>:delete_all
  has_many  :shopping_cart_items, :dependent=>:delete_all
  has_many  :order_items, :dependent=>:delete_all
  has_many  :course_assets, :dependent=>:delete_all
  belongs_to  :course_category
  has_many  :course_registrants, :dependent=>:delete_all

  #has_many :course_users
  #has_many :courses, :through => :course_users
  #has_many :instructors, :through => :course_users, :class_name => "User", :source => :user, :conditions => ['course_users.instructor = ?',true]
    
  validates_numericality_of :price
  validates_presence_of :title, :price, :description
  
  before_save :set_friendly_url  
  
  default_scope order("`order`, `title`")
  scope :by_search_term,  proc {|search_term| where("(courses.title like ? or courses.description like ?)", search_term, search_term) }
  scope :by_course_date_id,  proc {|course_date_id| joins("INNER JOIN course_dates on course_dates.course_id = courses.id").where("(course_dates.id = ?)", course_date_id) }
  scope :active, where(:active=>true)
  
  def set_friendly_url
    self.friendly_url =  friendlyize(self.title) + "?course_id=" + self.id.to_s
  end

  def friendlyize(content)
    content.downcase.gsub(/[^a-z0-9]+/i, '-')
  end
  
end
