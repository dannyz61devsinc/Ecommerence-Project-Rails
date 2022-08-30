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
      user1= User.create(name: 'kkk' ,email: 'lagah@gmail.com',password: 876356473)
      user1.profile_image.attach(io: File.open(Rails.root.join('app/assets/images/index.html')),
      filename: 'index.html')
      expect(user1).to_not be_valid
    end

    it 'should return email' do
      user1=User.create(name: 'kkk' ,email: 'lagah@gmail.com',password: 876356473)
      expect(user1.to_s).to eq('lagah@gmail.com')
    end

    it 'show default image' do
      user1 = User.create(name: 'kkk' ,email: 'lagah@gmail.com',password: 876356473)
      expect(user1.profile_image_thumbnail).to eq('/default_profile.jpg')
    end
  end
end
