class Instructorship < ActiveRecord::Base
  attr_accessible :course_date_id, :user_id
  belongs_to :user
  belongs_to :course_date
end
