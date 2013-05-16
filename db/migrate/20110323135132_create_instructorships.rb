class CreateInstructorships < ActiveRecord::Migration
  def self.up
    create_table :instructorships do |t|
      t.integer :course_date_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :instructorships
  end
end
