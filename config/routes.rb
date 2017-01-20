Rails.application.routes.draw do
  devise_for :users, 
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }

  get 'locations',      to: 'locations#index'
  get 'search',         to: 'results#index'
  get 'stylists',       to: 'stylists#index'
  
  root 'stylists/dashboards#show'
  
end
