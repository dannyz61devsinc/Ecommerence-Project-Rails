# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    association :user, factory: :user
    name { Faker::Commerce.product_name }
    description {  Faker::Lorem.paragraph }
    price { Faker::Number.number(digits: 3) }
    images { Rack::Test::UploadedFile.new('app/assets/images/2.jpg', '2.jpg') }

  end
end
