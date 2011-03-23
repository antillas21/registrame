class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :job

      t.timestamps
    end
    add_index :people, :email, :unique => true
  end

  def self.down
    drop_table :people
  end
end
