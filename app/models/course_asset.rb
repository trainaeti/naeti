class CourseAsset < ActiveRecord::Base
  
  default_scope order("updated_at desc")
  
  
  belongs_to  :course
  
  
  has_attached_file :asset 

  validates_presence_of :title, :description
  
  
  validates_attachment_size :asset, :less_than => 20.megabytes, :if => Proc.new { |asset| asset.asset_file_name != nil }
 

  
end
