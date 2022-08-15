# frozen_string_literal: true

class CheckoutsController < ApplicationController
  before_action :authenticate_user!

  def create
    begin
    cart = ProductCart.find(params[:product_cart_id])
    product = Product.find(cart.product.id)
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, notice: 'record_not_found'
  end 
    stripeobj = StripeService.new(product)
    @session = stripeobj.call
    respond_to do |format|
      format.js
    end
    generate_order(cart)
  end

  def generate_order(cart)
    order = Order.create(user_id: current_user.id)
    OrderProduct.create(order_id: order.id, product_id: cart.product.id, quantity: cart.quantity)
  end
end
