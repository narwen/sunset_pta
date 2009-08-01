class Position < ActiveRecord::Base
  validates_uniqueness_of :title
  acts_as_authorization_object
end
