Rails.application.routes.draw do


  devise_for :users
  root to: 'events#index'
  get 'home/private'

  resources :events do
    resources :attendances
  end
  
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
