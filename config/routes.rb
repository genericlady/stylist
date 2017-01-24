Rails.application.routes.draw do
  devise_for :users, 
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }

  get 'beauty_providers', to: 'beauty_providers#index'
  get 'locations',        to: 'locations#index'
  get 'search',           to: 'results#index'
  get 'stylists/:id',     to: 'stylists#show'

  resources :users, only: [:show, :update]
  
  root 'static_pages#home'
  
end
