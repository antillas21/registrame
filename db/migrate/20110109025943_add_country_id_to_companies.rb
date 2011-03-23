class AddCountryIdToCompanies < ActiveRecord::Migration
  def self.up
    add_column :companies, :country_id, :integer, :index => true
  end

  def self.down
    remove_column :companies, :country_id
  end
end

