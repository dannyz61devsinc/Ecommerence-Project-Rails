# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    association :user, factory: :user
    association :product, factory: :product
    body { 'comment' }
  end
end
