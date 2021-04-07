class PersonnelController < ApplicationController

  def index
    @personnel = @department.degree_levels
  end


  private

  def find_department
    @department = Department.find(params[:id])
  end
end
