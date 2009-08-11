class Student < ActiveRecord::Base
  belongs_to :parent, :class_name => 'User'
end
