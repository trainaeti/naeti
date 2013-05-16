class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      
      t.string  :session_id
      t.integer :user_id
      t.decimal :total
      t.string :transaction_id

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
