class BoardMembersController < UsersController
  
  access_control :only => :new, :helper => :show_new_link? do
    allow :admin
  end
  
  access_control :only => [:update, :edit] do
    allow :admin
    allow logged_in, :if => :same_user?
  end
 
  access_control :only => [:edit, :delete], :helper => :show_editdel_link? do
    allow :admin, :board_member
    allow logged_in, :if => :same_user?
  end
  
  def index
    # first get all the board members that have a position
    @board_members = User.all(:joins => :position, :order => :position)
    # then get all the board members that are chairs. Chairs may not have positions.

    @chairs = User.all(:joins => :assignments, :conditions => {'assignments.duty_id' => Duty.find_by_name("Chair")}, :group => 'users.id, users.email, users.crypted_password, users.password_salt, users.first_name, users.last_name, persistence_token, users.created_at, users.updated_at, users.address, users.position_id, users.home_phone, users.cell_phone, users.perishable_token, users.active')
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @board_members }
    end
  end
 
  def new
    redirect_to new_user_path(@user)
  end
  
  def edit
    redirect_to edit_user_path(@user)
  end
 
  def show
    redirect_to user_path(@user)
  end

end
