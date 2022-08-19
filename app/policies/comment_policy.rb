# frozen_string_literal: true

class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def edit?
    @user == @record.user
  end

  def destroy?
    @user == @record.user
  end

  def update?
    edit?
  end
end
