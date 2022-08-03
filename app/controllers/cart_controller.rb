# frozen_string_literal: true

class CartController < ApplicationController
  def index
    redirect_to root_path, notice: 'Cart is empty' if current_user.cart.nil?
  end

  def create
    @cart = Cart.create(user_id: current_user.id)
  end
end
