Rails.application.routes.draw do
  root 'landing_pages#index'
  
  resources :valuations
  resources :orders
  resources :accounts
  devise_for :users
  resources :users
  get '/dashboard' => 'users#dashboard'
  
  resources :pairs
  post 'pairs/update_all'
end
