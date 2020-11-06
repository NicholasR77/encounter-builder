Rails.application.routes.draw do
  resources :pcs
  resources :npcs
  resources :encounters
  resources :users
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'
end
