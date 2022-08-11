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
                                                  success_url: 'https://ecommerencedevsinc.herokuapp.com/',
                                                  cancel_url: 'https://ecommerencedevsinc.herokuapp.com/'
                                                })
  end

  # def status(session)
  #   @complete = Stripe::Checkout::Session.retrieve(
  #     session[:,
  #   )
  # end
end
