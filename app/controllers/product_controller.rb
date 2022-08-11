# frozen_string_literal: true

class ProductController < ApplicationController
  before_action :find_product, only: %i[show edit destroy update]

  def index
    @query = Product.ransack(params[:q])
    @products = @query.result
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
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, notice: 'record_not_found'
  end

  def param_for_product
    params.require(:product).permit(:name, :description, :price, images: [])
  end
end
