class CreateCourseAssets < ActiveRecord::Migration
  def self.up
    create_table :course_assets do |t|
      t.integer :course_id
      t.string :title
      t.text :description
      t.string :asset_file_name
      t.string :asset_content_type
      t.integer :asset_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :course_assets
  end
end
