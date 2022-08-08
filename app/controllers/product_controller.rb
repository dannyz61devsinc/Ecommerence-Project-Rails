# frozen_string_literal: true

class ProductController < ApplicationController
  before_action :find_product, only: %i[show edit destroy update]
  before_action :set_query

  def index
    @products = Product.all
  end

  def set_query
    @query = Product.ransack(params[:q])
  end

  def new
    @product = current_user.products.build
  end

  def show
    @comment = Comment.new
    @product_cart = ProductCart.new
    @comments = @product.comments
  end

  def create
    @product = current_user.products.build(param_for_product)
    if @product.save
      redirect_to product_index_path
    else
      render 'new'
    end
  end

  def edit
    authorize @product
  end

  def destroy
    authorize @product
    @product.destroy
    redirect_to :root
  end

  def update
    authorize @product
    if @product.update(param_for_product)
      redirect_to :root
    else
      render 'new'
    end
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def param_for_product
    params.require(:product).permit(:name, :description, :price, images: [])
  end
end
