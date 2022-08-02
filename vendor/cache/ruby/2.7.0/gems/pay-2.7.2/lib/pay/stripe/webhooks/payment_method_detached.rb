module Pay
  module Stripe
    module Webhooks
      class PaymentMethodDetached
        def call(event)
          object = event.data.object
          pay_customer = Pay::Customer.find_by(processor: :stripe, processor_id: object.customer)

          # Couldn't find user, we can skip
          return unless pay_customer.present?

          Pay::Stripe::Billable.new(pay_customer).sync_payment_method(payment_method_id: object.id)
        end
      end
    end
  end
end
