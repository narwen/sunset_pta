class Position < ActiveRecord::Base
  validates_uniqueness_of :title
  acts_as_authorization_object
  acts_as_list
  default_scope :order => :position
  has_one :user

  def demote_others(new_holder)
    User.find_all_by_position_id(id).each do |holder|
      holder.update_attribute(:position_id, nil) if holder != new_holder
    end
  end

end
