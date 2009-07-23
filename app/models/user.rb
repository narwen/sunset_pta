class User < ActiveRecord::Base
  acts_as_authentic
  acts_as_authorization_subject
  acts_as_authorization_object
end
