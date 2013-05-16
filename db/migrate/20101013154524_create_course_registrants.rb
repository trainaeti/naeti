class CreateCourseRegistrants < ActiveRecord::Migration
  def self.up
    create_table :course_registrants do |t|
      t.integer :course_id
      t.integer :user_id
      t.string :status
      t.date :registration_date

      t.timestamps
    end
  end

  def self.down
    drop_table :course_registrants
  end
end
