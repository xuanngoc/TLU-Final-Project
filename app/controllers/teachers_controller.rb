class TeachersController < ApplicationController
  before_action :find_department, only: %i[index update show destroy]

  def index
    @teachers = @department.teachers
  end

  def new
  end

  def create
    # @object = Object.new(params[:object])
    # if @object.save
    #   flash[:success] = "Object successfully created"
    #   redirect_to @object
    # else
    #   flash[:error] = "Something went wrong"
    #   render 'new'
    # end
  end

  def show
  end

  def update
    # @object = Object.find(params[:id])
    # if @object.update_attributes(params[:object])
    #   flash[:success] = "Object was successfully updated"
    #   redirect_to @object
    # else
    #   flash[:error] = "Something went wrong"
    #   render 'edit'
    # end
  end


  def destroy

  end


  private

  def find_department
    @department = Department.find(params[:department_id])
  end
end
