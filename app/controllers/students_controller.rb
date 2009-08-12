class StudentsController < ApplicationController
  before_filter :fetch_user

  def index
    @student = Student.new
    @students = @user.students
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

  private
  def fetch_user
    @user = User.find(params[:user_id])
  end
end
