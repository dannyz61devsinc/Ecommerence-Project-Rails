# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    association :user, factory: :user
    association :product, factory: :product
    body { Faker::Lorem.word }
  end
end
