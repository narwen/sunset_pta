class User < ActiveRecord::Base


  acts_as_authentic do |c|
    c.validate_email_field = false
  end
  
  acts_as_authorization_subject

  validates_presence_of :first_name, :last_name, :address, :cell_phone, :home_phone  

  belongs_to :position
  has_many :students, :foreign_key => :parent_id
  
  has_many :assignments, :dependent => :destroy
  has_many :committees, :through => :assignments
  has_many :chaired_committees, :through => :assignments, :source => :committee,
    :conditions => "assignments.duty_id = '" + Duty.find_by_name("Chair").id.to_s + "'"

  before_save :update_board_member_role
  after_save :demote_others_from_my_position

  before_destroy :delete_assignments

  def full_name
    first_name + ' ' + last_name
  end

  def User.unique_chairs
    chair_assignments = Assignment.find(:all, :conditions => [ "duty_id = ?", Duty.find_by_name("Chair").id], :group => "user_id")
    uchairs = []
    if (!chair_assignments.empty?) then
      uchairs = chair_assignments.inject([User.find(chair_assignments[0].user_id)]) do | uchairs, chair_assignment|
        uchairs << User.find(chair_assignment.user_id) if (uchairs.last.id != chair_assignment.user_id)
        uchairs
      end
    end
    return uchairs
  end

  private

  def demote_others_from_my_position
    position.demote_others(self) if position
  end

  def is_chair?
    return self.assignments.exists?(:duty_id => Duty.find_by_name("Chair").id)
  end

  def update_board_member_role
    if is_chair?
      has_role!(:board_member)
    elsif self.position
      has_role!(:board_member)
    else
      has_no_role!(:board_member)
    end
  end

  def delete_assignments
    self.assignments.clear
  end

end
