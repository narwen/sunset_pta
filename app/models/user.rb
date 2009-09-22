class User < ActiveRecord::Base
  attr_accessible :persistance_token, :home_phone, :cell_phone, :address, :position_id, :last_name, :first_name, :email, :password, :password_confirmation

  merge_validates_uniqueness_of_email_field_options({:allow_blank => true})
  merge_validates_length_of_email_field_options({:allow_blank => true})
  merge_validates_format_of_email_field_options({:allow_blank => true})

  acts_as_authentic do |config|
    config.ignore_blank_passwords = false
  end
  
  acts_as_authorization_subject

  validates_presence_of :first_name, :last_name

  belongs_to :position
  has_many :students, :foreign_key => :parent_id

  has_many :assignments, :dependent => :destroy
  has_many :committees, :through => :assignments
  has_many :chaired_committees, :through => :assignments, :source => :committee,
    :conditions => 'assignments.duty_id = #{Duty.find_by_name("Chair").id.to_s}'

    before_save :update_board_member_role
  after_save :demote_others_from_my_position

  before_destroy :delete_assignments

  def full_name
    first_name + ' ' + last_name
  end

  def activate!(password, password_confirmation)
    self.active = true
    self.password = password
    self.password_confirmation = password_confirmation
    save
  end

  def deliver_signup_invitation!
    reset_perishable_token!
    Notifier.deliver_signup_invitation(self)
  end

  def deliver_activation_confirmation!
    reset_perishable_token!
    Notifier.deliver_activation_confirmation(self)
  end

  def active?
    active
  end

  def User.unique_chairs
    chair_assignments = Assignment.find(:all, :conditions => [ "duty_id = ?", Duty.find_by_name("Chair").id], :group => "user_id, assignments.id, assignments.committee_id, assignments.duty_id")
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
