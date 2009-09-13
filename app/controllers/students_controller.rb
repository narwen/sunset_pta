class StudentsController < ApplicationController
  before_filter :fetch_user

  access_control :only => :index do
    allow logged_in
  end

  access_control :only => :new, :helper => :show_new_link? do
    allow :admin, :board_member
    allow logged_in, :if => :same_user?
  end
  
  access_control :only => :edit, :helper => :show_edit_link? do
    allow :admin, :board_member
    allow logged_in, :if => :same_user?
  end
  
  access_control :only => :destroy, :helper => :show_delete_link? do
    allow :admin, :board_member
    allow logged_in, :if => :same_user?
  end


  def index
    @students = @user.students
  end

  def new
    @student = Student.new
  end

  def create
    @student = @user.students.build(params[:student])
    if @student.save
      flash[:notice] = "Student created successfully!"
      redirect_to user_students_path(@user)
    else
      render :action => "new"
    end
  end

  def edit
    @student = @user.students.find(params[:id])
  end

  def update
    @student = @user.students.find(params[:id])

    if @student.update_attributes(params[:student])
      flash[:notice] = 'Student updated successfully!'
      redirect_to user_students_path(@user)
    else
      render :action => "edit"
    end
  end

  def destroy
    @student = @user.students.find(params[:id])
    @student.destroy
    flash[:notice] = 'Student deleted successfully!'
    redirect_to(user_students_url(@user))
  end

  private
  def fetch_user
    @user = User.find(params[:user_id])
  end
  
  def same_user?
     current_user == @user
  end
end
