class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.string :title
      t.string :sku
      t.text :description
      t.decimal :price
      t.string :Duration
      t.text :Locations
      t.integer :instructor_id
      t.boolean :active
      t.text :prerequisites
      t.integer :course_category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
