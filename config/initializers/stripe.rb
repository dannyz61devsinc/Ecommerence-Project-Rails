# frozen_string_literal: true

Stripe.api_key = Rails.application.credentials[:stripe][:secret]
STRIPE_PUBLIC_KEY = Rails.application.credentials[:stripe][:public]
