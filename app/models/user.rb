class User < ActiveRecord::Base
  acts_as_authentic
  acts_as_authorization_subject

  belongs_to :position
  has_many :students, :foreign_key => :parent_id
  
  before_save :update_board_member_role
  after_save :demote_others_from_my_position

  private
  def demote_others_from_my_position
    position.demote_others(self) if position
  end

  def update_board_member_role
    if self.position
      has_role!(:board_member)
    else
      has_no_role!(:board_member)
    end
  end
end
