# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'
  get  '/policy', to: 'pages#policy'

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

  namespace :api, path: 'api/v1', constraints: { format: 'json' } do
    resources :users, only: :create
  end
end
