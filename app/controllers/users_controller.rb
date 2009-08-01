class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.attributes = params[:user]
    @user.save
    flash[:notice] = "Contact info updated successfully."
    redirect_to user_path(@user)
  end
end
