# frozen_string_literal: true

require 'rails_helper'


RSpec.describe 'ProductCarts', type: :request do
  let(:product) { create :product }
  let!(:product_cart) { create :product_cart }
  let!(:user) { create :user }

  describe 'GET #index' do
    context 'when User Sign in' do

      it 'get index' do
        sign_in(user)

        get product_cart_index_path
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:index)
      end
    end

    context 'when User Sign out ' do

      it 'get index' do
        sign_out(user)

        get product_cart_index_path
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:index)
      end
    end
  end

  describe 'Post #create' do
    context 'when User Sign in' do
      it 'post create' do
        sign_in(user)

        post product_product_cart_index_path(product)
        expect(response).to have_http_status(:found)
      end
      it 'post create with invalid product cart' do
        sign_in(user)
        post product_product_cart_index_path(product)
        post product_product_cart_index_path(product)

        expect(response).to have_http_status(:found)
      end
    end

    context 'when User Sign out' do

      it 'post create' do
        sign_out(user)

        post product_product_cart_index_path(product)
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe 'get #Edit' do
    context 'when User Sign in' do
      it 'get edit' do
        sign_in(user)
        get edit_product_cart_path(product_cart)
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe 'Patch #update' do
    context 'when User Sign in' do
      it 'patch update' do
        sign_in(product_cart.cart.user)
        params = { product_cart: { quantity: 66 }, id: product_cart.id }
        patch product_cart_path(params)

        expect(response).to have_http_status(:found)
      end 

      it 'patch invalid update' do
        sign_in(product_cart.cart.user)
        params = { product_cart: { quantity: nil }, id: product_cart.id }
        patch product_cart_path(params)

        expect(response).to have_http_status(:found)
      end 
    end
  end

  describe 'Delete #destroy' do
    context 'when User Sign in' do
      it 'delete destroy' do
        sign_in(product_cart.cart.user)

        delete product_cart_path(product_cart)
        expect(response).to have_http_status(:found)
      end

      it 'delete invalid destroy' do
        product_c= create :product_cart
        sign_in(product_c.cart.user)
        product_c.product=nil
        product_c.quantity=nil
        product_c.cart=nil
        delete product_cart_path(product_c)
        expect(response).to have_http_status(:found)
      end
    end
  end
end
