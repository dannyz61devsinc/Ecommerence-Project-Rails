# frozen_string_literal: true

class OrderController < ApplicationController
  def index; end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(user_id: current_user.id)
    if @order.save
      redirect_to order_index_path, notice: 'order was successfully created.'
    else
      redirect_to root, notice: 'Order was failed.'
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:user_id).with_defaults(user_id: current_user.id)
  end
end
