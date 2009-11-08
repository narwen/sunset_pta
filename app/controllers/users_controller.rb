class UsersController < ApplicationController
  before_filter :require_user, :only => [:show, :edit, :update]
  before_filter :fetch_user, :only => [:show, :edit, :update]

  access_control :only => :index do
    allow logged_in
  end

  access_control :only => :new do
    allow :admin, :board_member
  end
  
  access_control :only => [:update, :edit] do
    allow :admin, :board_member
    allow logged_in, :if => :same_user?    
  end

  access_control :only => :show, :helper => :show_invitation_link? do
    allow :admin, :board_member, :if => :inactive?
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

  def invite_volunteer
    fetch_user
    if @user.email.blank?
      flash[:notice] = "Cannot send an invitation without an email address."
      redirect_to :back
    else
      @user.deliver_signup_invitation!
      flash[:notice] = "Invitation sent."
      redirect_to :back
    end
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
    @user.password = @user.password_confirmation = Password.fetch_secret_password
    if @user.save
      flash[:notice] = "New volunteer #{@user.full_name} created."
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
  
  protected
  def fetch_user
    @user = User.find(params[:id])
  end
  
  def same_user?
    current_user == @user
  end
  def inactive?
    !@user.active
  end
end
