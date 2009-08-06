class AddPositionToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :position_id, :integer
  end

  def self.down
    remove_column :users, :position_id
  end
end
