# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do

  describe 'association is valid with' do
    it 'order' do
      should belong_to(:user)
    end

    it 'Order_Product' do
      should have_many(:order_products)
    end

    it 'product' do
      should have_many(:products)
    end
  end
end
