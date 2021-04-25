class DepartmentsController < ApplicationController
  before_action :find_department, only: %i[edit update show destroy]

  def index
    @departments = Department.all
  end

  def show
  end

  def new
  end

  def create
    @department = Department.new(department_params)
    if @department.save!
      flash[:notice] = 'Create successful'
    else
      flash[:alert] = 'Create failed'
    end
    redirect_to departments_path
  end

  def edit
  end

  def update
    if @department.update(department_params)
      flash[:notice] = 'Update successfull'
    else
      flash[:alert] = 'Update failed'
    end
    redirect_to departments_path
  end

  def destroy
    @department.destroy
    redirect_to departments_path
  end

  def show_personnel
    @department = Department.find(params[:department_id])

    personnels = User.where(degree_level: @department.degree_levels)

    render json: UserBlueprint.render(personnels, view: :department), status: :ok
  end

  private

  def find_department
    @department = Department.find(params[:id])
  end

  def department_params
    params.require(:department).permit(
      :code,
      :name,
      :user_id
    )
  end
end
