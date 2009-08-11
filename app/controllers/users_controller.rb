class UsersController < ApplicationController
  before_filter :fetch_user, :only => [:show, :edit, :update]

  can_edit_user = lambda do
    allow :admin
    allow :board_member
    allow logged_in, :if => :same_user?
  end

  access_control do
    action :update do
      allow :admin, :board_member
      allow logged_in, :if => :same_user?
    end
  end
  
  # access_control :only => :update, &can_edit_user

  access_control :helper => :show_edit_link?, :only => :edit, &can_edit_user

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
      redirect_to(@user)
    else
      render :action => "new"
    end
  end

  def update
    @user.attributes = params[:user]
    @user.save
    flash[:notice] = "User updated successfully."
    redirect_to user_path(@user)
  end
  
  private
  def fetch_user
    @user = User.find(params[:id])
  end
  
  def same_user?
    current_user == @user
  end
end
