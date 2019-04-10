# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'
  get  '/policy', to: 'pages#policy'
  resources :tickets, only: :create

  devise_for :users, controllers: { omniauth_callbacks: 'callbacks', registrations: 'registrations' }

  get '/dashboard', to: 'dashboard/calendars#index'
  namespace :dashboard do
    resources :customers
    resources :consultations
    resources :plans
    resources :calendars, only: %i[index] do
      get 'search', on: :collection
    end
  end

  get '/admin', to: 'admin/admin#index'
  namespace :admin do
    resources :users
    resources :tickets, only: %i[index show update]
  end

  namespace :api, path: 'api/v1', constraints: { format: 'json' } do
    resources :users, only: :create
  end
end
