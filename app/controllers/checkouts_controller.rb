# frozen_string_literal: true

class CheckoutsController < ApplicationController
  before_action :authenticate_user!
  def create
    product = Product.find(params[:product_id])
    @session = Stripe::Checkout::Session.create({
                                                  payment_method_types: ['card'],
                                                  line_items: [{
                                                    name: product.name,
                                                    amount: product.price,
                                                    currency: 'pkr',
                                                    quantity: 1
                                                  }],
                                                  mode: 'payment',
                                                  success_url: 'root_url',
                                                  cancel_url: 'root_url'
                                                })
    respond_to do |format|
      format.js
    end
  end
end
