class Committee < ActiveRecord::Base
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  has_many :committee_memberships
  has_many :members, :through => :committee_memberships, :source => :user
end
