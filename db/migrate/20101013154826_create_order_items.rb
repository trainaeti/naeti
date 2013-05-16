class CreateOrderItems < ActiveRecord::Migration
  def self.up
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :course_id
      t.integer :course_date_id
      t.integer :quantity
      t.string :transaction_id

      t.timestamps
    end
  end

  def self.down
    drop_table :order_items
  end
end
