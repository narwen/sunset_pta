class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string :name
      t.string :grade
      t.string :room
      t.string :teacher
    end
  end

  def self.down
    drop_table :students
  end
end
