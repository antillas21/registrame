class AddFontSizeToLabel < ActiveRecord::Migration
  def self.up
    add_column :labels, :font_size, :integer
  end

  def self.down
    remove_column :labels, :font_size
  end
end
