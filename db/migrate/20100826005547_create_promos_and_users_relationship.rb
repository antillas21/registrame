class CreatePromosAndUsersRelationship < ActiveRecord::Migration
  def self.up
    create_table :promos_users, :id => false do |t|
      t.integer :user_id
      t.integer :promo_id
      t.timestamps
    end
  end

  def self.down
    drop_table :promos_users
  end
end
