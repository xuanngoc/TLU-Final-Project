class CostTypesController < ApplicationController
  before_action :find_cost_type, only: [:update, :destroy]

  def index
    @cost_types = CostType.all
  end

  def create
    cost_type = CostType.new(cost_type_params)
    if cost_type.save
      flash[:notice] = 'Tạo thành công'
    else
      flash[:alert] = 'Tạo không thành công'
    end
    redirect_to cost_types_path
  end

  def update
    if @cost_type.update(cost_type_params)
      flash[:notice] = 'Cập nhật thành công'
    else
      flash[:alert] = 'Cập nhật không thành công'
    end
    redirect_to cost_types_path
  end

  def destroy
    if @cost_type.destroy
      flash[:notice] = 'Delete successful'
    else
      flash[:alert] = 'Delete failed'
    end
    redirect_to cost_types_path
  end


  def api_index
    cost_types = CostType.all
    render json: CostTypeBlueprint.render(cost_types)
  end

  private

  def cost_type_params
    params.required(:cost_type).permit(
      :name
    )
  end

  def find_cost_type
    @cost_type = CostType.find(params[:id])
  end
end
