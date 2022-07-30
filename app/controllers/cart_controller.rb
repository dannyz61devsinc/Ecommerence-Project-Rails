class CartController < ApplicationController
  before_action :set_cart, only: [:destroy]
  before_action :find_product ,only:[:create]
  def index
    @carts=Cart.all
    # render json: @carts ,ok: true
  end
  def new
    @cart=current_user.build_cart
    find_product
  end
  def create
  @cart=current_user.build_cart(params_cart)

  if @cart.save(validate: false)
      redirect_to product_cart_index_path
    else
      render 'new'
    end
  end
  def update
    
  end
  def destroy
    
  end
  private
  def find_product
  # @product=Product.all
  # @product=@product.find(params[:product_id])


  end
  def set_cart
  @cart=Cart.find(params[:id])
  end
  def params_cart
    params.require(:cart).permit(:quantity,:product_id).with_defaults(product_id: params[:product_id])
  end
end
