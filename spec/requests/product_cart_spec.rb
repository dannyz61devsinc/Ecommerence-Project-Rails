require 'rails_helper'

RSpec.describe "ProductCarts", type: :request do
  let(:user) { create :user }
  let(:product) { create :product}

  let(:product_cart) { create :product_cart }
  before(:each) {sign_in(user)}

  it 'GET /index' do
    get product_cart_index_path
    expect(response).to have_http_status(:success)
    expect(response).to render_template(:index)
  end


  it 'has sign in user in create' do
    post product_product_cart_index_path(product  )
    expect(response).to have_http_status(302)
  end



  it 'edit with User' do
    patch product_cart_path(product_cart)
    expect(response).to have_http_status(302)
  end

  it 'update with User' do
    get edit_product_cart_path(product_cart)
    expect(response).to have_http_status(302)
  end

  it 'destroy with User' do
    delete product_cart_path(product_cart)
    expect(response).to have_http_status(302)
  end
end
