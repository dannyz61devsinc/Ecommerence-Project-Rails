# frozen_string_literal: true

class CartController < ApplicationController
  skip_before_action :authenticate_user!
end
