# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {create :user}
  it 'is not valid without name' do
    user.name=nil
    expect(user).to_not be_valid
  end
  it 'is not valid without email' do
    user.email=nil
    expect(user).to_not be_valid
  end
  it 'is not valid without password' do
    user.password=''
    expect(user).to_not  be_valid
  end
end
