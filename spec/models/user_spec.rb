# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'association is valid with' do
    it 'products' do 
      should have_many(:products)  
    end
    it 'comments' do 
      should have_many(:comments)  
    end
    it 'cart' do 
      should have_one(:cart)  
    end
    it 'orders' do 
      should have_many(:orders)  
    end
  end

  describe 'attribute' do
    it 'is valid with profile_image' do
      should have_one_attached(:profile_image)
     end
    it 'is valid with name' do
     should validate_presence_of(:name)
    end

    it 'is valid with email' do
      should validate_presence_of(:email)
    end

    it 'is valid with password' do
      should validate_presence_of(:password)
    end

    it 'is not valid with wrong Picture format' do
      user1 = create :user
      user1.profile_image.attach(io: File.open(Rails.root.join('app/assets/images/index.html')),
      filename: 'index.html')
      expect(user1).to_not be_valid
      expect(user1.errors[:profile_image]).to include('must be a JPEG or PNG')
    end

    it 'should return email' do
      user1 = create :user
      expect(user1.to_s).to eq(user1.email)
    end

    it 'show default image' do
      user1 = create(:user,profile_image: nil)
      expect(user1.profile_image_thumbnail).to eq('/default_profile.jpg')
    end
  end
end
