Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  get 'stylists/index', to: 'stylists#index'
  get 'stylists',       to: 'stylists#index'
  
  root 'dashboard#index'
end
