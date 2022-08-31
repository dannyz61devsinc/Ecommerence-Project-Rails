# frozen_string_literal: true

require 'rails_helper'


RSpec.describe 'ProductCarts', type: :request do
  let(:product) { create :product }
  let(:product_cart) { create :product_cart }
  let(:user) { create :user }

  describe 'GET #index' do
    context 'when User Sign in' do
      it 'get index' do
        sign_in(user)
        get product_cart_index_path
        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:index)
      end
    end

    context 'when User Sign out ' do
      it 'get index' do
        sign_out(user)
        get product_cart_index_path
        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:index)
      end
    end
  end

  describe 'Post #create' do
    context 'when User Sign in' do
      it 'should create post' do 
        sign_in(user)
        post product_product_cart_index_path(product)
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to product_cart_index_path
        expect(flash[:notice]).to eq('cart was successfully created.')
        expect(ProductCart.count).to eq(1)

      end

      it 'post create with invalid product cart' do
        sign_in(user)
        post product_product_cart_index_path(product)
        post product_product_cart_index_path(product)
        expect(response).to have_http_status(:found)
        expect(flash[:notice]).to eq('cart was failed. already Existed')
      end
    end

    context 'when User Sign out' do
      it 'should post create' do
        sign_out(user)
        post product_product_cart_index_path(product)
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to product_cart_index_path
        expect(flash[:notice]).to eq('Product was successfully created.')
        expect(ProductCart.count).to eq(0)
      end
    end
  end

  describe 'get #Edit' do
    context 'when User Sign in' do
      it 'get edit' do
        sign_in(product_cart.cart.user)
        get edit_product_cart_path(product_cart)
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'Patch #update' do
    context 'when User Sign in' do
      it 'patch update' do
        sign_in(product_cart.cart.user)
        params = { product_cart: { quantity: Faker::Number.number(digits: 2) },id: product_cart.id }
        patch product_cart_path(params)
        p=ProductCart.find(product_cart.id)
        expect(response).to have_http_status(:found)
        expect(flash[:notice]).to eq('Successfully updated')
        expect(p.quantity).to eq(params[:product_cart][:quantity])

      end

      it 'patch invalid update' do
        sign_in(product_cart.cart.user)
        params = { product_cart: { quantity: nil }, id: product_cart.id }
        patch product_cart_path(params)
        expect(flash[:notice]).to eq('Failed updation')
        expect(response).to have_http_status(:found)
      end 
    end
  end

  describe 'Delete #destroy' do
    context 'when User Sign in' do
      it 'delete destroy' do
        sign_in(product_cart.cart.user)
        c = ProductCart.count
        delete product_cart_path(product_cart)
        expect(response).to have_http_status(:found)
        expect(flash[:notice]).to eq('cart was Deleted.')
        expect(ProductCart.count).to eq(c-1)
      end

      it 'delete invalid destroy' do
        sign_in(product_cart.cart.user)
        delete product_cart_path(product_cart)
        expect(response).to have_http_status(:found)
      end
    end
  end
end
