Rails.application.routes.draw do
  root 'welcome#index'

  get '/logout' => 'sessions#destroy'
  get '/login' => 'sessions#new'
  post '/login' => "sessions#create"

  resources :sessions
  resources :visits
  resources :restaurants
  resources :users
  
end
