Rails.application.routes.draw do

  root 'index#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get "/users" => "users#index"
  get "users/:id" => "users#show", as: :user

  resources :articles
  resources :votes
end
