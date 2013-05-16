class CreateExpirationYears < ActiveRecord::Migration
  def self.up
    create_table :expiration_years do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :expiration_years
  end
end
