class User < ActiveRecord::Base

  merge_validates_uniqueness_of_email_field_options({:allow_blank => true})
  merge_validates_length_of_email_field_options({:allow_blank => true})
  merge_validates_format_of_email_field_options({:allow_blank => true})
  acts_as_authentic
  acts_as_authorization_subject

  validates_presence_of :first_name, :last_name

  belongs_to :position
  has_many :students, :foreign_key => :parent_id

  has_many :assignments, :dependent => :destroy
  has_many :committees, :through => :assignments

  before_save :update_board_member_role
  after_save :demote_others_from_my_position

  before_destroy :delete_assignments

  def full_name
    first_name + ' ' + last_name
  end

  private

    def demote_others_from_my_position
      position.demote_others(self) if position
    end

    def update_board_member_role
      if self.assignments.exists?(:duty_id => Duty.find_by_name("Chair").id)
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
