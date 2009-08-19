class StudentsController < ApplicationController
  before_filter :fetch_user

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

  private
  def fetch_user
    @user = User.find(params[:user_id])
  end
end
