Rails.application.routes.draw do
  root 'welcome#index'

  get '/logout' => 'sessions#destroy'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  get '/auth/google_oauth2/callback' => 'sessions#google_create'
  get '/auth/failure' => 'welcome#index'

  resources :sessions
  resources :visits
  resources :restaurants
  resources :users
  
end
