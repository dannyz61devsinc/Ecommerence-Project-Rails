# frozen_string_literal: true

FactoryBot.define do
  factory :order_product do
    association :order, factory: :order
    association :product, factory: :product
    quantity { Faker::Number.number(digits: 2) }
  end
end
