# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }

  namespace :api, path: 'v1' do
    resources :users
  end
end
