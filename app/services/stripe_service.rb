# frozen_string_literal: true

class StripeService
  def initialize(cart)
    @cart = cart
  end

  def call
    @session = Stripe::Checkout::Session.create({
                                                  payment_method_types: ['card'],
                                                  line_items: [{
                                                    name: @cart.product.name,
                                                    amount: @cart.product.price,
                                                    currency: 'usd',
                                                    quantity: @cart.quantity
                                                  }],
                                                  mode: 'payment',
                                                  success_url: 'https://ecommerencedevsinc.herokuapp.com/',
                                                  cancel_url: 'https://ecommerencedevsinc.herokuapp.com/'
                                                })
  end
end
