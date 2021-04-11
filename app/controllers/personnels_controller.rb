class PersonnelsController < ApplicationController
  before_action :find_department, only: [:index]

  def index
    @degrees = {}
    @department.degree_levels.each do |degree|
      @degrees[degree] = degree.users
    end
  end


  def create
    password = SecureRandom.hex(8)
    params[:degree_personnels][:password] = '123123'

    personnel = User.new(personnel_params)
    personnel.role = :personnel
    if personnel.save
      flash[:notice] = 'Create successful'
    else
      flash[:notice] = 'Create failed'
    end
    redirect_to department_personnels_path
  end

  def search_personnel
    name = params[:name]
    personnels = User.searchByName(name)
    render json: UserBlueprint.render(personnels, view: :normal), status: :ok
  end

  private

  def personnel_params
    params.require(:degree_personnels).permit(
      :full_name,
      :email,
      :password,
      :gender,
      :address,
      :birthday,
      :degree_level_id
    )
  end

  def find_department
    @department = Department.find(params[:department_id])
  end
end
