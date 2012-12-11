class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city

      t.timestamps
    end
    add_index :companies, :name
    add_index :companies, :city
  end

  def self.down
    drop_table :companies
  end
end

