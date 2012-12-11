class CreateInterestsAndPeopleRelationship < ActiveRecord::Migration
  def self.up
    create_table :interests_people, :id => false do |t|
      t.integer :person_id
      t.integer :interest_id
      t.timestamps
    end
    add_index :interests_people, :person_id
    add_index :interests_people, :interest_id
  end

  def self.down
    drop_table :interests_people
  end
end
