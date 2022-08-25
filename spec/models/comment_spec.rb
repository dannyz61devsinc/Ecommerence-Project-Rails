# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create :user }
  let(:product) { create :product }
  let(:comment) { create :comment }

  it 'is not valid with empty body' do
    comment.body = ''
    expect(comment).not_to be_valid
  end

  it 'is not valid without User' do
    comment.user = nil
    expect(comment).not_to be_valid
  end

  it 'is not valid without Product' do
    comment.product = nil
    expect(comment).not_to be_valid
  end

  it 'is valid with body' do
    expect(comment).to be_valid
  end
end
