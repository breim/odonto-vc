# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'
  get  '/policy', to: 'pages#policy'

  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }

  get '/dashboard', to: 'dashboard/calendars#index'
  namespace :dashboard do
    resources :calendars, path: 'agenda', only: %i[index] do
      # get 'search', on: :collection
    end
    resources :customers, path: 'pacientes'
  end

  namespace :api, path: 'api/v1', constraints: { format: 'json' } do
    resources :users, only: :create
  end
end
