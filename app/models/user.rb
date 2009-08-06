class User < ActiveRecord::Base
  acts_as_authentic
  acts_as_authorization_subject

  belongs_to :position

  after_save :demote_others_from_my_position

  private
  def demote_others_from_my_position
    position.demote_others(self) if position
  end
end