class AddPdfLinkToCourse < ActiveRecord::Migration
  def self.up
    add_column :courses, :pdf_location, :string
  end

  def self.down
    remove_column :courses, :pdf_location
  end
end
