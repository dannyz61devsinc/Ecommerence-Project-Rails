# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :allow_permit_params, if: :devise_controller?
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def after_sign_in_path_for(_resource)
    @cart = session[:cart]
    tranfer_data_in_cart(@cart) unless @cart.nil?
    root_path
  end

  def tranfer_data_in_cart(cart)
    cart.each do |id|
      @productcart = ProductCart.new(cart_id: current_user.cart.id, product_id: id, quantity: 1)
      if current_user != @productcart.product.user
        @productcart.save
      else
        flash[:alert] = 'You cannot add your own products'
      end
    end
  end

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_back(fallback_location: root_path)
  end

  protected

  def allow_permit_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:profile_image])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
