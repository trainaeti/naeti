class CreateShoppingCartItems < ActiveRecord::Migration
  def self.up
    create_table :shopping_cart_items do |t|
      t.integer :shopping_cart_id
      t.integer :course_id
      t.integer :course_date_id
      t.integer :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :shopping_cart_items
  end
end
