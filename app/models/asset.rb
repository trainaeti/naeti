class Asset < ActiveRecord::Base

    default_scope order("updated_at desc")

    has_attached_file :asset, :styles => { :medium => "300x300>", :thumb => "100x100>" }

end
