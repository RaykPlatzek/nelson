Rails.application.routes.draw do
  root 'landing_pages#index'
  
  resources :valuations
  post 'valuations/update_all'
  resources :orders
  resources :accounts
  get '/cash_account' => 'accounts#cash_account'
  devise_for :users
  resources :users
  get '/dashboard' => 'users#dashboard'
  resources :pairs
end
