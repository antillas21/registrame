class CreateNameBadges < ActiveRecord::Migration
  def self.up
    create_table :name_badges do |t|
      t.string :name
      t.float :width
      t.float :height
      t.float :left
      t.float :right
      t.float :top
      t.float :bottom

      t.timestamps
    end
    add_index :name_badges, :name
  end

  def self.down
    drop_table :name_badges
  end
end
