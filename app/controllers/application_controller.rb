class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pagy::Frontend


  protect_from_forgery with: :exception

  before_action :authenticate_user!
end
