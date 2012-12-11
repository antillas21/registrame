class AddPrintedToPeople < ActiveRecord::Migration
  def self.up
    add_column :people, :printed, :boolean, :default => false
    add_index :people, :printed
  end

  def self.down
    remove_column :people, :printed
  end
end
