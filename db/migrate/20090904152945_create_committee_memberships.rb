class CreateCommitteeMemberships < ActiveRecord::Migration
  def self.up
    create_table :committee_memberships do |t|
      t.integer :user_id           , :null => false
      t.integer :committee_id      , :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :committee_memberships
  end
end
