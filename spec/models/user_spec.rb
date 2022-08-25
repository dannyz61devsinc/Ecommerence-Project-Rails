# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do

  describe "association is valid with" do
      it 'products' do 
        should have_many(:products)  
      end
      it 'comments' do 
        should have_many(:comments)  
      end
      it 'products' do 
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
  end
end
