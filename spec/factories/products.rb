# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    association :user, factory: :user
    name { 'product' }
    description { 'hello' }
    price { 200 }
  end
end
