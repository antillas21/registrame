class AddSectorIdToCompanies < ActiveRecord::Migration
  def self.up
    add_column :companies, :sector_id, :integer, :index => true
  end

  def self.down
    remove_column :companies, :sector_id
  end
end
