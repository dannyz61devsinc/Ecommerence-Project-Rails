# frozen_string_literal: true

require 'test_helper'

class ProductCartControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get product_cart_create_url
    assert_response :success
  end
end
