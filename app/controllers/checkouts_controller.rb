# frozen_string_literal: true

class CheckoutsController < ApplicationController
  before_action :authenticate_user!

  def create
    begin
      product = Product.find(params[:product_id])
    rescue ActiveRecord::RecordNotFound => e
      redirect_to root_path, notice: 'record_not_found'
    end
    @session = Stripe::Checkout::Session.create({
                                                  payment_method_types: ['card'],
                                                  line_items: [{
                                                    name: product.name,
                                                    amount: product.price,
                                                    currency: 'usd',
                                                    quantity: 1
                                                  }],
                                                  mode: 'payment',
                                                  success_url: root_url,
                                                  cancel_url: root_url
                                                })
    respond_to do |format|
      format.js
    end
  end
end
