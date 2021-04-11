class DegreeLevelsController < ApplicationController

  before_action :find_degree, only: [:edit, :update, :show, :destroy]

  def index
    @degrees = {}
    @departments = Department.all

    @departments.each do |department|
      @degrees[department] = DegreeLevel.where(department_id: department.id)
    end
    # byebug
  end

  def new
  end

  def create
    @degree = DegreeLevel.new(degree_params)
    if @degree.save
      flash[:notice] = 'Create successful'
    else
      flash[:alert] = 'Create failed'
    end
    redirect_to degree_levels_path
  end

  def edit
  end

  def update
    if  @degree.update(degree_params)
      flash[:notice] = 'Create successful'
    else
      flash[:alert] = 'Create failed'
    end
    redirect_to degree_levels_path
  end


  def destroy
    if @degree.destroy
      flash[:notice] = 'Delete successful'
    else
      flash[:alert] = 'Delete failed'
    end
    redirect_to degree_levels_path
  end

  private

  def find_degree
    @degree = DegreeLevel.find(params[:id])
  end

  def degree_params
    params.required(:degree_employee).permit(
      :degree_type,
      :name,
      :department_id
    )
  end
end
