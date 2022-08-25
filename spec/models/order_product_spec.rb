# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrderProduct, type: :model do
  let(:product) { create :product }
  let(:order_product) { create :order_product }

  it 'is not valid without order' do
    order_product.order = nil
    expect(order_product).to_not be_valid
  end

  it 'is not valid without Product' do
    order_product.product = nil
    expect(order_product).to_not be_valid
  end
end
