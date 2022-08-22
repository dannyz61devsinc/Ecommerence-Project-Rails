# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:user) { create :user }
  let(:product) { create :product }

  it 'GET /index' do
    get product_index_path
    expect(response).to have_http_status(:success)
    expect(response).to render_template(:index)
  end

  it 'has sign in user in new' do
    sign_in(user)
    get new_product_path
    expect(response).to render_template(:new)
  end

  it 'has sign in user in create' do
    sign_in(user)
    params = { product: { name: 'test', description: 'test', price: 45 } }
    post product_index_path(params)
    expect(response).to have_http_status(302)
  end

  it 'has to display Product' do
    get product_path(product)
    expect(response).to render_template(:show)
  end

  it 'edit with User' do
    sign_in(user)
    patch product_path(product)
    expect(response).to have_http_status(302)
  end

  it 'update with User' do
    sign_in(user)
    get edit_product_path(product)
    expect(response).to have_http_status(302)
  end

  it 'destroy with User' do
    sign_in(user)
    delete product_path(product)
    expect(response).to have_http_status(302)
  end
end
