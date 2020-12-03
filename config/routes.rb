Rails.application.routes.draw do
  root 'pages#home'
  resources :users
  resources :encounters
  resources :items, only: [:index]

  resources :pcs do
    resources :items
  end

  resources :npcs do
    resources :items
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'
end
