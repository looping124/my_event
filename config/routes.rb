Rails.application.routes.draw do

  get 'users/index'
  get 'users/new'
  get 'users/create'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  devise_for :users
  root to: 'events#index'
  get 'home/private'

  resources :events
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
