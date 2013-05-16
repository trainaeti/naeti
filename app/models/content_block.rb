class ContentBlock < ActiveRecord::Base
  
  
  before_save :set_friendly_url

  validates_presence_of :name
  validates_uniqueness_of :name
  
  default_scope order("name")
  
  def set_friendly_url
    self.friendly_url =  friendlyize(self.name)
  end

  def friendlyize(content)
    content.downcase.gsub(/[^a-z0-9]+/i, '-')
  end
  
  
end
