# frozen_string_literal: true
Rails.application.routes.draw do
  root 'fuel_logs#new'

  resources :cars, only: [:new, :create, :edit, :update, :index, :destroy]
  resources :fuel_logs, only: [:new, :create, :index]
  resources :service_logs, only: [:new, :create, :index]

  get '/login', to: 'sessions#new'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:post, :get]
  get '/logout', to: 'sessions#destroy'
  get '/no_session', to: 'sessions#missing'
  get '/no_privileges', to: 'sessions#insufficient'
end
