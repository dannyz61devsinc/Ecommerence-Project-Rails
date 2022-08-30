# frozen_string_literal: true

FactoryBot.define do
  factory :product_cart do
    association :cart, factory: :cart
    association :product, factory: :product
    quantity { Faker::Number.number(digits: 2) }
  end
end
