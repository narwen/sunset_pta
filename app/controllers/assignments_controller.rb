class AssignmentsController < ApplicationController

  access_control :only => :index do
    allow logged_in
  end

  access_control :only => [:new, :edit, :create, :update, :destroy] do
    allow :admin, :board_member
  end

  access_control :helper => :can_edit_assignments? do
    allow :admin, :board_member
  end

  before_filter :fetch_user

  # GET users/:user_id/assignments
  # GET users/:user_id/assignments.xml
  def index
    @assignments = @user.assignments

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @assignments }
    end
  end

  # GET users/:user_id/assignments/new
  # GET users/:user_id/assignments/new.xml
  def new
    @assignment = @user.assignments.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @assignment }
    end
  end

  # GET users/:user_id/assignments/1/edit
  def edit
    @assignment = @user.assignments.find(params[:id])
  end

  # POST users/:user_id/assignments
  # POST users/:user_id/assignments.xml
  def create
    @assignment = @user.assignments.new(params[:assignment])

    respond_to do |format|
      if @assignment.save
        flash[:notice] = 'Committee assignment was successfully created'
        format.html { redirect_to user_assignments_path(@user) }
        format.xml  { render :xml => @assignment, :status => :created, :location => @assignment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @assignment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT users/:user_id/assignments/1
  # PUT users/:user_id/assignments/1.xml
  def update
    @assignment = @user.assignments.find(params[:id])

    respond_to do |format|
      if @assignment.update_attributes(params[:assignment])
        flash[:notice] = 'Committee assignment was successfully updated.'
        format.html { redirect_to user_assignments_path(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @assignment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE users/:user_id/assignments/1
  # DELETE users/:user_id/assignments/1.xml
  def destroy
    @assignment = @user.assignments.find(params[:id])
    @assignment.destroy

    respond_to do |format|
      format.html { redirect_to user_assignments_path(@user) }
      format.xml  { head :ok }
    end
  end

  private
  def fetch_user
    @user = User.find(params[:user_id])
  end
  
end
