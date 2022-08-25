# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:user) { create :user }
  let(:product) { create :product }

  it 'is not valid without name' do
    product.name = ''
    expect(product).to_not be_valid
  end

  it 'is not valid without User' do
    product.user = nil
    expect(product).to_not be_valid
  end

  it 'is not valid without description' do
    product.description = ''
    expect(product).to_not be_valid
  end

  it 'is not valid without price' do
    product.price = nil
    expect(product).to_not be_valid
  end
end
