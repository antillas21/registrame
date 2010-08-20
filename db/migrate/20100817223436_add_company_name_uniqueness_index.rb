class AddCompanyNameUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :companies, :name, :unique => true
  end

  def self.down
    remove_index :companies, :name
  end
end
