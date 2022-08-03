# frozen_string_literal: true

class AddQuantityToProductCart < ActiveRecord::Migration[5.2]
  def change
    add_column :product_carts, :quantity, :int
  end
end
