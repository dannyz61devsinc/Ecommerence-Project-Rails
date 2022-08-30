# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe 'asoociation is valid with' do
    it 'User attributes' do
      should belong_to(:user)
    end

    it 'product_carts' do
      should have_many(:product_carts)
    end

    it 'products' do
      should have_many(:products)
    end
  end
end
