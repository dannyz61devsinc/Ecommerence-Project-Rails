# frozen_string_literal: true

class OrderProductController < ApplicationController
  # def new
  #   @order_product = OrderProduct.new
  # end

  def create
    @product = Product.find(params[:product_id])
    if @product.user != current_user
      @order = Order.create(user_id: current_user.id)
      @order_product = OrderProduct.create(order_id: @order.id, product_id: @product.id)

      # @order = OrderProduct.create(user_id: current_user.id, Product: @product)
      if @order.save
        redirect_to order_index_path, notice: 'order was successfully created.'
      else
        redirect_to root, notice: 'Order was failed.'
      end
    else
      redirect_to root_path, notice: 'Order was failed. You cannot add your products'
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  # def order_params
  #   params.require(:order_product).permit(:order_id,:product_id).with_defaults()
  # end
end
