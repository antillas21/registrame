class AddIndexToTables < ActiveRecord::Migration
  def self.up
    add_index :companies, :state_id
    add_index :companies, :country_id
    add_index :companies, :sector_id
    add_index :people, :registration_id
    add_index :people, :company_id
  end

  def self.down
    remove_index :companies, :state_id
    remove_index :companies, :country_id
    remove_index :companies, :sector_id
    remove_index :people, :registration_id
    remove_index :people, :company_id
  end
end
