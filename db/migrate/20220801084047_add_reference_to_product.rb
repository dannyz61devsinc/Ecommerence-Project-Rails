# frozen_string_literal: true

class AddReferenceToProduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :user, foreign_key: true
  end
end
