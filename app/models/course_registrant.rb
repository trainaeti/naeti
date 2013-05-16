class CourseRegistrant < ActiveRecord::Base
  
  belongs_to  :course
  belongs_to  :user
  
  scope :paid, where(:status=>"Paid")
  scope :waiting, where(:status=>"Waiting List")                               
    
end
