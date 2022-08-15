# frozen_string_literal: true

class AddColumnToOrderProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :order_products, :quantity, :int
  end
end
