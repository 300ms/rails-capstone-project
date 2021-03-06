# frozen_string_literal: true

Rails.application.routes.draw do
  root 'index#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  get '/users' => 'users#index'
  get 'users/:id' => 'users#show', as: :user

  resources :articles, only: [:index, :new, :show, :create, :destroy]
  resources :votes, only: [:create, :destroy]
  resources :categories, only: [:index, :show]
end
