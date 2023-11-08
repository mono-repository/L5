Rails.application.routes.draw do
  get 'top/main'
  post 'top/login'
  get 'top/logout'
  
  resources :tweets
  resources :users
  resources :likes, only: [:create, :destroy]
  
  root 'tweets#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
