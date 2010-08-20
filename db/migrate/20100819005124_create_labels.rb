class CreateLabels < ActiveRecord::Migration
  def self.up
    create_table :labels do |t|
      t.string :name
      t.integer :width
      t.integer :height
      t.integer :top
      t.integer :bottom
      t.integer :left
      t.integer :right

      t.timestamps
    end
  end

  def self.down
    drop_table :labels
  end
end
