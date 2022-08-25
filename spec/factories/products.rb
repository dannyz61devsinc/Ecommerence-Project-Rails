# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    association :user, factory: :user
    name { 'product' }
    description { 'hello' }
    price { 200 }
    images { Rack::Test::UploadedFile.new('app/assets/images/2.jpg', '2.jpg') }

  end
end
