require 'rails_helper'

RSpec.describe 'ProductCarts', type: :request do
  let(:product) { create :product }
  let(:product_cart) { create :product_cart }
  let(:user) { create :user }

  context 'With User Sign in' do
    before(:each) { sign_in(user) }

    it 'get index' do
      get product_cart_index_path
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end

    it 'post create' do
      post product_product_cart_index_path(product)
      expect(response).to have_http_status(302)
    end

    it 'patch edit' do
      patch product_cart_path(product_cart)
      expect(response).to have_http_status(302)
    end

    it 'get update' do
      get edit_product_cart_path(product_cart)
      expect(response).to have_http_status(302)
    end

    it 'delete destroy' do
      delete product_cart_path(product_cart)
      expect(response).to have_http_status(302)
    end
  end

  context 'Without User ' do
    it 'get index' do
      get product_cart_index_path
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end

    it 'post create' do
      post product_product_cart_index_path(product)
      expect(response).to have_http_status(302)
    end

    it 'patch Edit' do
      patch product_cart_path(product_cart)
      response.should redirect_to new_user_session_path
    end

    it 'get update' do
      get edit_product_cart_path(product_cart)
      response.should redirect_to new_user_session_path
    end

    it 'delete destroy' do
      delete product_cart_path(product_cart)
      response.should redirect_to new_user_session_path
    end
  end
end
