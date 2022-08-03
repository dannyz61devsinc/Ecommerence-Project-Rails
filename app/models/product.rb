# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy, dependent: :destroy

  has_many :product_carts
  has_many :carts, through: :product_carts, dependent: :destroy

  has_many :order_products, dependent: :destroy
  has_many :orders, through: :order_products, dependent: :destroy

  validates :name, :price, :description, presence: true
  has_many_attached :images
end
