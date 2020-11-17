Rails.application.routes.draw do
  root 'pages#home'
  resources :users
  resources :encounters do
    resources :pcs, only: [:show, :index, :new]
    resources :npcs, only: [:show, :index, :new]
  end
  resources :pcs
  resources :npcs

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'
end
