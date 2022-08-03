# frozen_string_literal: true

Rails.application.routes.draw do
  get 'subscriptions/create'
  get 'subscriptions/new'
  get 'subscription/create'
  get 'subscription/new'
  get 'search/index'
  resources :product do
    resources :order_product, only: %i[new create]
    resources :product_cart, only: %i[new create]
    resources :comments
  end

  resources :checkouts
  resources :cart
  devise_for :users
  resources :order
  resources :search
  resources :order_product, only: [:show]
  resources :product_cart, only: %i[show destroy index edit update]

  root to: 'product#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
