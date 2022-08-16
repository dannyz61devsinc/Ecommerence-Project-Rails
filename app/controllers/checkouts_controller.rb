# frozen_string_literal: true

class CheckoutsController < ApplicationController
  def create
    cart = ProductCart.find(params[:product_cart_id])

    stripeobj = StripeService.new(cart)
    @session = stripeobj.call
    respond_to do |format|
      format.js
    end
    generate_order(cart)
  end

  def generate_order(cart)
    authorize cart
    cart.destroy
    order = Order.create(user_id: current_user.id)
    OrderProduct.create(order_id: order.id, product_id: cart.product.id, quantity: cart.quantity)
  end
end
