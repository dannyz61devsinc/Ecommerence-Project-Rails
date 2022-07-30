# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :carts

  validates :name, :price, :description, presence: true
  has_many_attached :images
end
