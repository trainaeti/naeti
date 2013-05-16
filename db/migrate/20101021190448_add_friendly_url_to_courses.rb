class AddFriendlyUrlToCourses < ActiveRecord::Migration
  def self.up
    add_column :courses, :friendly_url, :string
  end

  def self.down
    remove_column :courses, :friendly_url
  end
end
