class AddPositionToPositions < ActiveRecord::Migration
  def self.up
    # this is an integer for acts_as_list. just a coincidence that it's also called 'position'.
    add_column :positions, :position, :integer
    Position.reset_column_information
    positions = Position.all

    positions.each_with_index do |p, i|
      p.position = i + 1
      p.save!
    end
  end

  def self.down
    remove_column :positions, :position
  end
end
