class AddPrintedBooleanToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :printed, :boolean
  end

  def self.down
    remove_column :users, :printed
  end
end
