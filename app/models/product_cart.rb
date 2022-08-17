# frozen_string_literal: true

class ProductCart < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  validates :quantity, presence: true
  validates :product_id, uniqueness: true

  def to_builder
    Jbuilder.new do |cart|
      cart.product  product.price
      cart.quantity quantity
    end
  end
end
