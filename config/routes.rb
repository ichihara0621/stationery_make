Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  resources :users
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get  '/insert',  to: 'stationery#new'
  post '/insert',  to: 'stationery#create'
  resources :stationery
  resources :password_resets
end