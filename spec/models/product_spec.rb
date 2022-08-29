# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do


  describe 'asoociation is valid with' do
    it 'User' do
      should belong_to(:user)
    end

    it 'Comments' do
        should have_many(:comments)
    end

    it 'Product Carts' do
      should have_many(:product_carts)
    end

    it 'Order_Product' do
      should have_many(:order_products)
    end

    it 'Order' do
      should have_many(:orders)
    end
  end

  describe 'attribute' do
    it 'is valid with images' do
      should have_many_attached(:images)
     end
    it 'is valid with name' do
      should validate_presence_of(:name)
    end

    it 'is valid with price' do
      should validate_presence_of(:price)
    end

    it 'is valid with description' do
      should validate_presence_of(:description)
    end
  end
end
