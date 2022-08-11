# frozen_string_literal: true

class ProductCartController < ApplicationController
  before_action :set_product_cart, only: %i[edit update destroy]
  before_action :authenticate_user!
  before_action :find_product, only: [:create]

  def index
    @product_cart = ProductCart.where(cart_id: current_user.cart.id) unless current_user.cart.nil?
  end

  def create
    if current_user.cart.nil?
      @cart = Cart.create(user_id: current_user.id)
      @product_cart = ProductCart.new(cart_id: @cart.id, product_id: @product.id, quantity: 1)
    else
      @product_cart = ProductCart.new(cart_id: current_user.cart.id, product_id: @product.id, quantity: 1)
    end
    authorize @product_cart
    if @product_cart.save
      redirect_to product_cart_index_path, notice: 'cart was successfully created.'
    else
      redirect_to root_path, notice: 'cart was failed.'
    end
  end

  def find_product
    @product = Product.find(params[:product_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, notice: 'record_not_found'
  end

  def edit
    authorize @product_cart
  end

  def update
    authorize @product_cart

    if @product_cart.update(product_cart_prams)
      redirect_to product_cart_index_path, notice: 'Successfully updated'
    else
      redirect_to root_path, notice: 'Failed updation'
    end
  end

  def destroy
    authorize @product_cart

    if @product_cart.destroy
      redirect_to product_cart_index_path, notice: 'cart was Deleted.'
    else
      redirect_to root, notice: 'cart was failed to delete.'
    end
  end

  private

  def product_cart_prams
    params.require(:product_cart).permit(:quantity)
  end

  def set_product_cart
    @product_cart = ProductCart.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, notice: 'record_not_found'
  end
end
