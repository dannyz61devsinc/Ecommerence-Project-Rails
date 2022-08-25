# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create :user }
  let(:product) { create :product }
  let(:comment) { create :comment }

  describe 'association valid with' do
    it 'User' do
      should belong_to(:user)
    end

    it 'Product' do
      should belong_to(:product)
    end
  end

  describe 'attributes' do
    it 'is valid with body' do
      should validate_presence_of(:body)
    end
  end
end
