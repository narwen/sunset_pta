class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|
      t.integer :user_id
      t.integer :committee_id
      t.integer :duty_id

      t.timestamps
    end
  end

  def self.down
    drop_table :assignments
  end
end
