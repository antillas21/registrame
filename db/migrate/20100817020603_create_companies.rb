class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :zip
      t.integer :state_id
      t.integer :country_id
      t.string :phone
      t.string :website
      t.integer :sector_id

      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
