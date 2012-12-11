class AddFontSizeToNameBadge < ActiveRecord::Migration
  def self.up
    add_column :name_badges, :font_size, :integer
  end

  def self.down
    remove_column :name_badges, :font_size
  end
end
