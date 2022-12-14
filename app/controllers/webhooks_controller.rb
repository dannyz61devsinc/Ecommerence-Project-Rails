# frozen_string_literal: true

class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    byebug
    event = nil

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, Rails.application.credentials[:stripe][:webhook]
      )
    rescue JSON::ParserError => e
      status 400
      return
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      Rails.logger.debug 'Signature error'
      Rails.logger.debug e
      return
    end

    # Handle the event
    case event.type
    when 'checkout.session.completed'
      redirect_to order_index_path, notice: 'Session is complete successfulyy'
      session = event.data.object
      session_with_expand = Stripe::Checkout::Session.retrieve({ id: session.id, expand: ['line_items'] })
      session_with_expand.line_items.data.each do |line_item|
        product = Product.find_by(stripe_product_id: line_item.price.product)
        order = Order.create(user_id: current_user.id)
        OrderProduct.create(order_id: order.id, product_id: product.id)
      end
    end

    render json: { message: 'success' }
  end
end
