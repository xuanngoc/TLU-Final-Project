class TeachersController < ApplicationController
  before_action :find_department, only: %i[index update show destroy]
  before_action :find_teacher, only: %i[ edit update show destory ]

  def index
    @teachers = @department.teachers
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params.except(:user))
    @user = User.new(teacher_params[:user])
    # byebug
    if @teacher.save and @user.save
      @teacher.user = @user
      @teacher.save
      flash[:success] = "Teacher successfully created"
      redirect_to department_teachers_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def show
  end

  def update
    if @teacher.update(teacher_params)
      flash[:success] = "Teacher was successfully updated"
      redirect_to department_teachers_path
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end


  def destroy

  end


  private

  def teacher_params
    params.required(:teacher).permit(
      :department_id,
      :full_name,
      :address,
      :gender,
      :birthday,
      :academic_levels,
      user: [
        :email,
        :password
      ]
    )
  end

  def find_department
    @department = Department.find(params[:department_id])
  end

  def find_teacher
    @teacher = Teacher.find(params[:id])
  end
end
