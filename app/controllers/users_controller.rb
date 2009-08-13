class UsersController < ApplicationController
  before_filter :fetch_user, :only => [:show, :edit, :update]

  access_control :only => :new do
    allow :admin, :board_member
  end
  
  access_control :only => [:update, :edit] do
    allow :admin, :board_member
    allow logged_in, :if => :same_user?    
  end

  access_control :only => :edit, :helper => :show_edit_link? do
    allow :admin, :board_member
    allow logged_in, :if => :same_user?
  end

  access_control :only => [:edit, :update], :helper => :can_assign_position? do
    allow :admin
  end
  
  def index
    @users = User.all(:order => 'last_name ASC')
  end
  
  def show
  end

  def edit
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    
    # this is needed, since password is required, and no password is entered when someone creates the user
    # obviously, this isn't what was intended...
    if @user.password.blank? || @user.password_confirmation.blank?
      @user.password = @user.password_confirmation = "secret"
    end
    
    if @user.save
      flash[:notice] = "New user #{@user.full_name} created."
      redirect_to user_path(@user)
    else
      render :action => "new"
    end
  end

  def update
    @user.attributes = params[:user]
    
    unless can_assign_position?
      @user.position_id = @user.position_id_was
    end
    
    if @user.save
      flash[:notice] = "User updated successfully."
      redirect_to user_path(@user)
    else
      render :action => "edit"
    end
  end
  
  private
  def fetch_user
    @user = User.find(params[:id])
  end
  
  def same_user?
    current_user == @user
  end
end
