class BorrowingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    user.is_librarian?
  end

  def return?
    user.is_librarian?
  end

  def index?
    user.is_librarian?
  end

  def add?
    user.is_member?
  end

  def remove?
    user.is_member?
  end

  def checkout?
    user.is_member?
  end
end
