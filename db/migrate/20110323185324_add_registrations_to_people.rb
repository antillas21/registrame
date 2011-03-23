class AddRegistrationsToPeople < ActiveRecord::Migration
  def self.up
    add_column :people, :registration_id, :integer, :index => true
  end

  def self.down
    remove_column :people, :registration_id
  end
end
