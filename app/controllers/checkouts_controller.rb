# frozen_string_literal: true

class CheckoutsController < ApplicationController
  before_action :authenticate_user!

  def create
    begin
      product = Product.find(params[:product_id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, notice: 'record_not_found'
    end
    stripeobj = StripeService.new(product)
    @session = stripeobj.call
    respond_to do |format|
      format.js
    end
    # complete=stripeobj.status(@session)
    flash[:alert] = @session

    # if @session[:status] == 'complete'
    #   flash[:alert]='Session is complete successfulyy'
    # else

    # end
  end
end
