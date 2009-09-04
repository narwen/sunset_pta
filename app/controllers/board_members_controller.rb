class BoardMembersController < UsersController
  before_filter :fetch_user, :only => [:show, :edit, :update]

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
    @board_members = User.find(:all, 
                               :select => '*', 
                               :joins => 'join positions on positions.id = position_id')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @board_members }
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

  private
  def fetch_user
    @user = User.find(params[:id])
  end
end
