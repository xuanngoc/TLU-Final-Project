Rails.application.routes.draw do

  root 'home#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :departments do
    resources :personnels
    get '/api/personnels', to: 'departments#show_personnel'
  end

  resources :degree_levels
  resources :cost_types
  resources :limit_costs, only: [:index]

  scope :api do
    scope :v1 do
      scope :degree do
        get 'limit_costs', to: 'limit_costs#get_by_degree'
      end

      scope :cost_types do
        get '/', to: 'cost_types#api_index'
      end
    end
  end

  resources :business_trips
  resources :request_payments do
    post 'approve', to: 'request_payments#approve'
  end

  resources :business_trips do
    resources :request_payments
  end

  resources :reason_rejects, only: [:create]

  resources :report_request_payments do
    resource :download, only: [:show]
  end

  get 'list_payment_request', to: 'request_payments#list_request_payment'

  put 'limit_costs/update_multiple', to: 'limit_costs#update_multiple'
  get 'api/v1/personnels', to: 'personnels#search_personnel'
end
