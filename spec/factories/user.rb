# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Number.number(digits: 10) }
    profile_image { Rack::Test::UploadedFile.new('app/assets/images/2.jpg', '2.jpg') }
  end
end
