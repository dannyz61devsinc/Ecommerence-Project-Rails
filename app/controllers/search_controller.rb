# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    @result = @query.result
  end
end
