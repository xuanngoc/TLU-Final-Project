class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user, only: [:show, :edit, :update]

  def index
    @pagy, @users = pagy(User.where.not(role: :admin).order(:id))
  end

  def show

  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:success] = "Cập nhật thành công"
      redirect_to @user
    else
      flash[:success] = "Cập nhật không thành công"
      render :edit
    end
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :full_name,
      :email,
      :birthday,
      :gender,
      :address
    )
  end

end
