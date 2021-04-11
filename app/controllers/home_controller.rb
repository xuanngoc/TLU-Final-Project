class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :show, :destory]

  def index

  end
end
