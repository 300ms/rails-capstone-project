Rails.application.routes.draw do

  root 'index#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get "/users" => "users#index"
  get "users/:id" => "users#show", as: :user
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
