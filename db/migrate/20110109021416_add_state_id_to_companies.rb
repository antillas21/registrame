class AddStateIdToCompanies < ActiveRecord::Migration
  def self.up
    add_column :companies, :state_id, :integer, :index => true
  end

  def self.down
    remove_column :companies, :state_id
  end
end

