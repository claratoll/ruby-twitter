Rails.application.routes.draw do
  devise_for :users
  resources :tweets

  get 'home/index'
  root to: "tweets#index"

  resources :tweets, except: [:edit, :update]




  get "up" => "rails/health#show", as: :rails_health_check

end
