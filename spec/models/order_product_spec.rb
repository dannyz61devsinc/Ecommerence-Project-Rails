# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrderProduct, type: :model do
  let( :order_product ) { create :order_product }

  describe 'association is valid with' do
    it 'order' do
      should belong_to(:order)
    end

    it 'Product' do
      should belong_to(:product)
    end
  end

  describe 'attibutes' do
    it 'is valid with quantity' do
      should validate_presence_of(:quantity)
    end
  end
end
