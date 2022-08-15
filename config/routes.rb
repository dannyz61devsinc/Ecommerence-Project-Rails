# frozen_string_literal: true

Rails.application.routes.draw do
  resources :search, only: [:index]
  resources :product do
    resources :order_product, only: %i[new create]
    resources :product_cart, only: %i[new create]
    resources :comments
  end

  resources :cart
  devise_for :users
  resources :order
  resources :order_product, only: [:index,:show]
  resources :product_cart, only: %i[show destroy index edit update] do
    resource :checkout, only: [:create]
  end
  resources :webhooks, only: [:create]
  root to: 'product#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
