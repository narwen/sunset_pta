class Committee < ActiveRecord::Base
  has_many :assignments, :dependent => :destroy
  has_many :users, :through => :assignments

  validates_presence_of :name
  validates_uniqueness_of :name

  before_destroy :delete_assignments

  private

  def delete_assignments
    self.assignments.clear
  end
end
