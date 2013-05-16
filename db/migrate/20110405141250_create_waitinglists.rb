class CreateWaitinglists < ActiveRecord::Migration
  def self.up
    create_table :waitinglists do |t|
      t.string :email
      t.integer :course_date_id
      t.boolean :is_contacted

      t.timestamps
    end
  end

  def self.down
    drop_table :waitinglists
  end
end
