Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'


  root 'main#home'
  get '/about', to: 'main#about'

  resources :articles
  resources :categories, except:[:destroy]

  get 'signup', to: 'users#new'
  # post 'users', to: 'users#create'
  resources :users, exept: [:new]
 end
