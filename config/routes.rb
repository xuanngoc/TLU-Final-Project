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
  resources :limit_costs, only: [:index]

  scope :api do
    scope :v1 do
      scope :degree do
        get 'limit_costs', to: 'limit_costs#get_by_degree'
      end
    end
  end

  put 'limit_costs/update_multiple', to: 'limit_costs#update_multiple'
end
