class AddParentToStudent < ActiveRecord::Migration
  def self.up
    add_column :students, :parent_id, :integer
  end

  def self.down
    remove_column :students, :parent_id
  end
end
