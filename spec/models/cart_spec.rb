# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:user) { create :user }
  let(:cart) { create :cart }

  it 'is not valid without User attributes' do
    cart.user = nil
    expect(cart).not_to be_valid
  end

  it 'is  valid with User attributes' do
    expect(cart).to be_valid
  end
end
