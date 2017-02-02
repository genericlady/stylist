Rails.application.routes.draw do
  devise_for :users, 
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }

  get 'locations',            to: 'locations#index'
  get 'search',               to: 'results#index'

  resources :users, only: [:show, :update]
  resources :users do 
    resources :services
  end

  root 'static_pages#home'
  
end
