Rails.application.routes.draw do
  devise_for :users

  get 'home/index'
  root to: "tweets#index"

  resources :tweets, except: [:edit, :update]

  get '/followers', to: 'home#followers'

  get "up" => "rails/health#show", as: :rails_health_check

end
