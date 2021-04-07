Rails.application.routes.draw do

  root 'home#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :departments do
    resources :teachers
  end

  resources :degree_levels
  resources :cost_types
  resources :limit_costs

end
