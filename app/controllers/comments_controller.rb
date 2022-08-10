# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment
  before_action :find_comment, only: %i[edit destroy update]

  def index; end

  def create
    @comment = @product.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
  end

  def show; end

  def edit
    authorize @comment
  end

  def update
    authorize @comment
    if @comment.update(comment_params)
      redirect_to :root
    else
      render 'new'
    end
  end

  def destroy
    authorize @comment
    @comment.destroy
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :product_id)
  end

  def find_comment
    @comment = @product.comments.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to root_path, notice: 'record_not_found'
  end

  def set_comment
    @product = Product.find(params[:product_id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to root_path, notice: 'record_not_found'
  end
end
