# frozen_string_literal: true

class ProductCartPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def edit?
    @user.cart == @record.cart
  end

  def create?
    current_user != @product.user
  end

  def update?
    edit?
  end

  def destroy?
    @user.cart == @record.cart
  end
end
