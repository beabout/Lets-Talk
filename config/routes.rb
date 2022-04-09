Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'application#index'

  get 'home', action: :index, controller: 'application'

  resources :portal  
  resources :topics
  resources :conversations do
    post 'add_user', action: :add_user
    resources :messages
  end


end
