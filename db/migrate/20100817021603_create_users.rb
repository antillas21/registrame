class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.integer :registration_id
      t.string :fname
      t.string :lname
      t.string :email
      t.string :job
      t.integer :department_id
      t.integer :company_id

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
