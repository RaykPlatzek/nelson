Rails.application.routes.draw do
  root 'landing_pages#index'
  
  resources :valuations
  resources :orders
  resources :accounts
  devise_for :users
  resources :users
  get 'pairs/new'
  get 'pairs/create'
  post 'pairs/update_all'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
