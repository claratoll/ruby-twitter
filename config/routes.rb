Rails.application.routes.draw do
  devise_for :users

  resources :friends
  resources :users, only: [:show]
  resources :tweets, except: [:edit, :update]

  get '/followers', to: 'home#followers'
  get 'users', to: 'home#users'

  get "up" => "rails/health#show", as: :rails_health_check

  get 'home/index'

  post 'follow/:id', to: 'home#follow', as: 'follow_user'
  delete 'unfollow/:id', to: 'home#unfollow', as: 'unfollow_user'

  root to: "tweets#index"
end
