# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:user) { create :user }
  it 'is not valid without User attributes' do
    expect(Order.create).to_not be_valid
  end

  it 'is  valid with User attributes' do
    expect(Order.new(user_id: user.id)).to be_valid
  end
end