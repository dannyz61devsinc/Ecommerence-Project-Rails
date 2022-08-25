# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrderProduct, type: :model do


  describe 'association is valid with' do
    it 'order' do
      should belong_to(:order)
    end

    it 'Product' do
      should belong_to(:product)
    end
  end
end
