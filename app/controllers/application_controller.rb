# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :allow_permit_params, if: :devise_controller?
  before_action :set_query
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_back(fallback_location: root_path)
  end

  def set_query
    @query = Product.ransack(params[:q])
  end

  protected

  def allow_permit_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:profile_image])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
