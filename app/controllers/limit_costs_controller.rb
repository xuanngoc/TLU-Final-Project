class LimitCostsController < ApplicationController

  before_action :find_degree, only: [:edit, :update, :show, :destory]

  def index
    @degrees = {}
    @departments = Department.all

    @departments.each do |department|
      @degrees[department] = DegreeLevel.where(department_id: department.id)
    end
  end


  def get_by_degree
    degree = DegreeLevel.find(params[:id])
    limit_costs = degree.limit_costs

    render json: LimitCostBlueprint.render(limit_costs, view: :normal)
  end

  def update_multiple
    limit_cost_params.each do |limit_id, limit_value|
      LimitCost.find(limit_id).update(limit_value)
    end
    redirect_to limit_costs_path
  end

  private

  def limit_cost_params
    params.require(:limit_cost).permit!
  end

end
