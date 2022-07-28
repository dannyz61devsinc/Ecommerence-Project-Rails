# frozen_string_literal: true

class ProductController < ApplicationController
  before_action :find_product, only: %i[show edit destroy update]
  def index
    @products = Product.all
  end

  def new
    @product = current_user.products.build
  end

  def show
    @comment = Comment.new
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

  def edit; end

  def destroy
    @product.destroy
    redirect_to :root
  end

  def update
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
