class AddFriendlyUrlToContentBlocks < ActiveRecord::Migration
  def self.up
    add_column :content_blocks, :friendly_url, :string
  end

  def self.down
    remove_column :content_blocks, :friendly_url
  end
end
