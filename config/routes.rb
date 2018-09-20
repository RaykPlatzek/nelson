Rails.application.routes.draw do
  root action: :index, controller: :pairs
  get 'pairs/new'
  get 'pairs/create'
  resources :pairs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
