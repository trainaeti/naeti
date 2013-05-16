class CourseCategory < ActiveRecord::Base
  has_many  :courses

  validates_presence_of :name
  validates_uniqueness_of :name
  
  default_scope order("`order`")
  
end
