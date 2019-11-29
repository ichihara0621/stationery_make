Rails.application.routes.draw do

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
  get  '/bought',  to: 'buy_items#bought'
  #get   '/add',    to: 'stationery#incart'
  post  '/add',    to: 'stationery#add'
  post  '/buy',    to: 'buy_items#change'
  post  '/leave',  to: 'users#leave'
  post  '/cancel/:id', to: 'users#cancel'
  post  '/stop/:id', to: 'users#stop'

  resources :stationery, :except => ['create','new']
  resources :password_resets
  resources :buy_items
  resources :rankings
end