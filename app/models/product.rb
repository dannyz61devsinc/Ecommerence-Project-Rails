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
  validate :check_image_type

  def check_image_type
    images.each do |image|
      errors.add(:image, 'must be a JPEG or PNG') unless image.content_type.in?(%w[image/jpeg image/png image/jpg])
    end
  end

  def to_builder
    Jbuilder.new do |product|
      product.price price
      product.name name
    end
  end
end
