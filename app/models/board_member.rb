class BoardMember < ActiveRecord::Base
  belongs_to :position, :class_name => 'Users'

end
