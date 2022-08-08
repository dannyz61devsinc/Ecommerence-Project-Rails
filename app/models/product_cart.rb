# frozen_string_literal: true

class ProductCart < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  validates :quantity, presence: true
end
