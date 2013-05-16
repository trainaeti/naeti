class UserAsset < ActiveRecord::Base

    default_scope order("updated_at desc")

    belongs_to  :user
    has_attached_file :asset 

    #validates_presence_of :title, :description
  
end
