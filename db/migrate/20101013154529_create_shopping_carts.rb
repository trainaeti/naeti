class CreateShoppingCarts < ActiveRecord::Migration
  def self.up
    create_table :shopping_carts do |t|

      t.string  :session_id
      t.integer :user_id
      t.decimal :total

      t.timestamps
    end
  end

  def self.down
    drop_table :shopping_carts
  end
end
