class ActivationsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]

  def new
    if (@user = User.find_using_perishable_token(params[:activation_code], 1.week)).nil?
      flash[:notice] = "Account activation failed. Your activation email could be out of date."
      redirect_to root_path
    end
    if @user && @user.active?
      flash[:notice] = "You are already active."
      redirect_to root_path
    end
  end

  def create
    @user = User.find(params[:id])

    raise Exception if @user.active?

    if @user.activate!(params[:password], params[:password_confirmation])
      @user.deliver_activation_confirmation!
      flash[:notice] = "Activation successful."
      redirect_to root_path
    else
      flash[:notice] = "There was a problem."
      render :action => :new
    end
  end
end
