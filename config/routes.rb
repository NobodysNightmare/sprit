# frozen_string_literal: true
Rails.application.routes.draw do
  root 'car_logs#new'

  resources :cars, only: [:new, :create, :edit, :update, :index, :destroy] do
    member do
      get 'summary'
    end
  end

  resources :car_logs, only: [:new, :create, :index]

  get '/login', to: 'sessions#new'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:post, :get]
  get '/logout', to: 'sessions#destroy'
  get '/no_session', to: 'sessions#missing'
  get '/no_privileges', to: 'sessions#insufficient'
end
