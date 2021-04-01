class DepartmentController < ApplicationController
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
    if @department.save
      flash[:notice] = 'Create successfull'
    else
      flash[:alert] = 'Create failed'
    end
    redirect_to department_index_path
  end

  def edit
  end

  def update
    if @department.update(department_params)
      flash[:notice] = 'Update successfull'
    else
      flash[:alert] = 'Update failed'
    end
    redirect_to department_index_path
  end

  def destroy
    @department.delete
    redirect_to department_index_path
  end

  private

  def find_department
    @department = Department.find(params[:id])
  end

  def department_params
    params.require(:department).permit(
      :code,
      :name
    )
  end
end
