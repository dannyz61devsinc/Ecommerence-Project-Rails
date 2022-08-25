# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductCart, type: :model do
  let(:product) { create :product }
  let(:product_cart) { create :product_cart }
  it 'is not valid with empty quantity' do
    product_cart.quantity = nil
    expect(product_cart).to_not be_valid
  end

  it 'is not valid without cart' do
    product_cart.cart = nil
    expect(product_cart).to_not be_valid
  end

  it 'is not valid without Product' do
    product_cart.product = nil
    expect(product_cart).to_not be_valid
  end
end
