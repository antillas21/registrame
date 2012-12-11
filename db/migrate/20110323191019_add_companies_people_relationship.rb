class AddCompaniesPeopleRelationship < ActiveRecord::Migration
  def self.up
    add_column :people, :company_id, :integer, :index => true
  end

  def self.down
    remove_column :people, :company_id
  end
end
