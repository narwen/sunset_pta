class Committee < ActiveRecord::Base
  has_many :assignments, :dependent => :destroy
  has_many :users, :through => :assignments
  has_many :chairs, :through => :assignments, :source => :user,
    :conditions => 'assignments.duty_id = #{Duty.find_by_name("Chair").id.to_s}'
  has_many :volunteers, :through => :assignments, :source => :user,
    :conditions => 'assignments.duty_id = #{Duty.find_by_name("Volunteer").id.to_s}'

  validates_presence_of :name
  validates_uniqueness_of :name

  before_destroy :delete_assignments

  private

  def delete_assignments
    self.assignments.clear
  end
end
