class PasswordController < ApplicationController
  before_action :authenticate_user!

  def edit

  end

  def update
    if current_user.reset_password(params[:password][:password], params[:password][:password_confirm])
      flash[:success] = 'Đổi mật khẩu thành công'
      redirect_to root_path
    else
      flash[:error] = 'Đổi mật khẩu không thành công'
      render :edit
    end
  end
end
