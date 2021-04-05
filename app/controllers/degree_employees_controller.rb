class DegreeEmployeesController < ApplicationController
  before_action :find_degree, only: [:edit, :update, :show, :destory]

  def index
    @degrees_education = DegreeEmployee.education
    @degrees_operation = DegreeEmployee.operation
  end

  def new
  end

  def create
    @degree = DegreeEmployee.new(degree_params)
    if @degree.save
      flash[:notice] = 'Create successful'
    else
      flash[:alert] = 'Create failed'
    end
    redirect_to degree_employees_path
  end

  def edit
  end

  def update
    if  @degree.update(degree_params)
      flash[:notice] = 'Create successful'
    else
      flash[:alert] = 'Create failed'
    end
    redirect_to degree_employees_path
  end


  def destroy
  end

  private

  def find_degree
    @degree = DegreeEmployee.find(params[:id])
  end

  def degree_params
    params.required(:degree_employee).permit(
      :degree_type,
      :name
    )
  end
end
