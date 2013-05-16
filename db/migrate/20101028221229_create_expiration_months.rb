class CreateExpirationMonths < ActiveRecord::Migration
  def self.up
    create_table :expiration_months do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :expiration_months
  end
end
