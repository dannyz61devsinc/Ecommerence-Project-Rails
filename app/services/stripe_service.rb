# frozen_string_literal: true

class StripeService
  def initialize(product)
    @product = product
  end

  def call
    @session = Stripe::Checkout::Session.create({
                                                  payment_method_types: ['card'],
                                                  line_items: [{
                                                    name: @product.name,
                                                    amount: @product.price,
                                                    currency: 'usd',
                                                    quantity: 1
                                                  }],
                                                  mode: 'payment',
                                                  success_url: 'http://localhost:3000/',
                                                  cancel_url: 'http://localhost:3000/'
                                                })
  end

  # def status(session)
  #   @complete = Stripe::Checkout::Session.retrieve(
  #     session[:,
  #   )
  # end
end
