class Assignment < ActiveRecord::Base

  belongs_to :user
  belongs_to :committee

  validates_presence_of :user_id, :committee_id, :duty_id

  validates_uniqueness_of :committee_id, :scope => 'user_id'
  validates_uniqueness_of :user_id, :scope => 'committee_id'

  after_save :update_board_member_role
  after_destroy :update_board_member_role

  private

  def update_board_member_role
    user = User.find self.user_id
#
# Don't need to check for and do role update here; done in user before_save
#
    user.save

  end

end
