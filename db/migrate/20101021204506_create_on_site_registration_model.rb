class CreateOnSiteRegistrationModel < ActiveRecord::Migration
  def self.up
    create_table :on_site_trainings do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :on_site_trainings
  end
end
