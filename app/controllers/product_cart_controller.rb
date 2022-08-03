# frozen_string_literal: true

class ProductCartController < ApplicationController
  before_action :set_product_cart ,only:[ :edit, :update, :destroy]
  def index
    @product_cart = ProductCart.where(cart_id: current_user.cart.id)
  end

  def create
    @product = Product.find(params[:product_id])
    if user_signed_in?
      if @product.user != current_user
        if current_user.cart.nil?
          @cart = Cart.create(user_id: current_user.id)
          @product_cart = ProductCart.new(cart_id: current_user.cart.id, product_id: @product.id, quantity: 1)
          
        else
          @product_cart = ProductCart.new(cart_id: current_user.cart.id, product_id: @product.id, quantity: 1)
        end
        if @product_cart.save
          redirect_to product_cart_index_path, notice: 'cart was successfully created.'
        else
          redirect_to root_path, notice: 'cart was failed.'
        end
      else
        redirect_to root_path, notice: 'cart was failed. You cannot add your products'
      end
    else
      @product_cart = ProductCart.new(cart_id: current_user.cart, product_id: @product.id, quantity: 1)
    end
  end
  def edit
  end
  
def update
  if @product_cart.update(product_cart_prams)
    redirect_to product_cart_index_path,notice: "Successfully updated"
  else
    redirect_to root_path,notice: "Failed updation"
  end
 
  
end

  def destroy
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
  end
end
