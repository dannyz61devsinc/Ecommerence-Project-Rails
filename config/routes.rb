# frozen_string_literal: true

Rails.application.routes.draw do
  resources :product do
    resources :cart
    resources :comments
  end
  resources :cart ,only:%i[index]
  devise_for :users
  root to: 'product#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
