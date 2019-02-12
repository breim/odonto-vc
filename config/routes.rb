# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }

  namespace :api, path: 'api/v1', constraints: { format: 'json' } do
    resources :users, only: :create
  end
end
