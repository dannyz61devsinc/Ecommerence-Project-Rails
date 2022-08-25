# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductCart, type: :model do
  let!(:product_cart) { create :product_cart }

  describe 'asoociation is valid with' do
    it 'cart' do
      should belong_to(:cart)
    end

    it 'Product' do
      should belong_to(:product)
    end
  end

  describe 'attibutes' do
    it 'is valid with quantity' do
      should validate_presence_of(:quantity)
    end

    it 'is valid with Unique Product' do
      should validate_uniqueness_of(:product_id)
    end
  end
end
