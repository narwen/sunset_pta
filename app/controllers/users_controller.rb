class UsersController < ApplicationController
  before_filter :fetch_user, :only => [:show, :edit, :update]

  can_edit_user = lambda do
    allow :admin
    allow :board_member
    allow logged_in, :if => :same_user?
  end
  
  access_control :only => :update, &can_edit_user

  access_control :helper => :show_edit_link?, :only => :edit, &can_edit_user

  def show
  end

  def edit
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
