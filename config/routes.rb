Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :ideas

  namespace :admin do
    resources :categories
  end
  
  root 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
